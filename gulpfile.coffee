# ==================================================
# Gulp Variables
# ==================================================
gulp = require('gulp')
gutil = require('gulp-util')

# Sass
sass = require('gulp-ruby-sass')

# Imagemin
imagemin = require('gulp-imagemin')

# Coffeescript
coffee = require('gulp-coffee')

# Sourcemaps
sourcemaps = require('gulp-sourcemaps')

# LiveReload
livereload = require('gulp-livereload')


# ==================================================
# Paths & Files
# ==================================================
sass_path     = 'sass'
css_path      = 'css'
img_path      = 'img'
font_path     = 'font'
coffee_path   = 'coffee'
js_path       = 'js'
public_path   = 'public'
watched_files = [
  '*.php'
  '*/*.php'
  '*.html'
  '*/*.html'
  "#{css_path}/*.css"
  "#{js_path}/*.js"
]

# ==================================================
# Tasks
# ==================================================

# Sass compilation for dev
gulp.task 'sass-dev', ->
  sass(sass_path,
    sourcemap: true
  ).on('error', gutil.log)
    .pipe(sourcemaps.write())
    .pipe gulp.dest(css_path)


# Sass compilation for prod
gulp.task 'sass-prod', ->
  sass(sass_path)
    .on('error', gutil.log)
    .pipe(sourcemaps.write())
    .pipe gulp.dest("#{public_path}/#{css_path}")


# Coffee compilation for dev
gulp.task 'coffee-dev', ->
  gulp.src("#{coffee_path}/*.coffee")
    .pipe(sourcemaps.init())
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(sourcemaps.write())
    .pipe gulp.dest(js_path)


# Coffee compilation for prod
gulp.task 'coffee-prod', ->
  gulp.src("#{coffee_path}/*.coffee")
    .pipe(sourcemaps.init())
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(sourcemaps.write())
    .pipe gulp.dest("#{public_path}/#{js_path}")


# Imagemin
gulp.task 'imgmin', ->
  gulp.src("#{img_path}/**")
    .pipe(imagemin({
      optimizationLevel: 7
    }))
    .pipe gulp.dest("#{public_path}/#{img_path}")


# Copy fonts for production release
gulp.task 'copy-fonts', ->
  gulp.src('./font/**/*.{eot,svg,ttf,woff,woff2}')
    .pipe gulp.dest("#{public_path}/#{font_path}")


# Copy markup for production release
gulp.task 'copy-markup', ->
  gulp.src(['./*.php', '.htaccess'])
    # Perform minification tasks, etc here
    .pipe(gulp.dest("#{public_path}"));


# Reload
gulp.task 'reload', ->
  gulp.src(watched_files)
    .pipe livereload()


# Preflight. Make ready for production.
gulp.task 'preflight', ->
  gulp.run(
    'imgmin',
    'sass-prod',
    'copy-fonts',
    'copy-markup'
  )


# Watch
gulp.task 'watch', ->
  livereload.listen()

  # Watch all the files in the sass directory
  gulp.watch "#{sass_path}/**", ['sass-dev']

  # Watch PHP, HTML, CSS, & JS
  gulp.watch watched_files, ['reload']


# Default Task
gulp.task 'default', ['sass-dev', 'coffee-dev', 'watch']
