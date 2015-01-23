namespace :gulp do
  task default: :asset_rev

  desc 'Build the site for release'
  task :build do
    run_locally do
      execute :gulp, '--no-color', 'preflight'
      set :gulp_timestamp, Time.new.strftime('%Y%m%d%H%M')
    end
  end

  desc 'Upload the built assets'
  task upload: :'gulp:build' do
    on roles(:all) do
      info "Uploading #{release_path}/public"
      upload! './public', "#{release_path}", recursive: true
    end
  end

  desc 'Rev the timestamp'
  task asset_rev: :'gulp:upload' do
    on roles(:all) do
      within release_path do
        execute(
          :sed,
          '-i',
          '-e',
          "s/style.css/style.#{fetch(:gulp_timestamp)}.css/",
          'public/index.php'
        )
      end
    end
  end
end
