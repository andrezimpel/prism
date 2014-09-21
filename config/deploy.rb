set :application, 'prism'
set :repo_url, 'git@github.com:andrezimpel/prism.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# set :deploy_to, '/var/www/my_app'
# set :scm, :git

set :rvm_ruby_version, '2.0.0-p353'
set :rvm_type, :user

set :format, :pretty
set :log_level, :debug
set :pty, true

set :linked_dirs, [
  "log",
  "restricted",
  "public/system",
  "tmp/cache",
  "tmp/pids",
  "tmp/sockets",
  "vendor/bundle",
]

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  # desc 'stop solr'
  # task :stop do
  #   run "cd #{current_path} && #{rake} RAILS_ENV=#{rails_env} sunspot:solr:stop"
  # end
  #
  # desc 'start solr'
  # task :start do
  #   run "cd #{current_path} && #{rake} RAILS_ENV=#{rails_env} sunspot:solr:start"
  # end
  #
  # desc 'reindex solr'
  # task :reindex do
  #   run "cd #{current_path} && #{rake} RAILS_ENV=#{rails_env} sunspot:solr:reindex"
  # end

  after :finishing, 'deploy:cleanup'
end
