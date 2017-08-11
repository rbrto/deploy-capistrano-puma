# config valid only for current version of Capistrano
lock "3.9.0"

set :application, "deploy-capistrano-puma"
set :repo_url, "git@github.com:rbrto/deploy-capistrano-puma.git"

# Default branch is :master
set :branch, :master
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deploy/deploy-capistrano-puma'

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/puma.rb', 'config/secrets.yml')

# Edit this if you are using a different Ruby version
set :rvm_ruby_version, 'ruby-2.3.1'

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# SSHKit.config.command_map[:sidekiq] = "source ~/.bash_profile && bundle exec sidekiq"
# SSHKit.config.command_map[:sidekiqctl] = "source ~/.bash_profile && bundle exec sidekiqctl"
set :bundle_bins, fetch(:bundle_bins, []).push('sidekiq', 'sidekiqctl')
# Default value for keep_releases is 5

# la configuracion de puma esta en sel server en shared/config/puma.rb ssh deploy@45.55.189.209
# cuenta robertoesparzaferrada@gmail.com jerseyshore0053
set :puma_conf, "#{shared_path}/config/puma.rb"

# descomento esto y agrego en linked files 'config/puma.rb'

# {shared_path} es la carpeta shared del server
