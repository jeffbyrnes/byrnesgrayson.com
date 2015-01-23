set :application, 'byrnesgrayson.com'
set :repo_url, 'git@bitbucket.org:jeffbyrnes/byrnesgrayson.com.git'
set :scm, :git

server 'byrnesgrayson.com', user: 'deploy', roles: %w(web app)

# Default value for :log_level is :debug
set :log_level, :debug

before 'deploy:published', 'gulp:default'
