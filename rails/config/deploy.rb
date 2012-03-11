require "bundler/capistrano"

set :application, "example"
set :user, "app"
set :use_sudo, false

set :scm, "git"
set :repository, "git@www.example.com:example.git"

role :web, "www.example.com"
role :app, "www.example.com"
role :db,  "www.example.com", :primary => true

set :deploy_via, :remote_cache
set :keep_releases, 10

desc "Deploys production code (Usage: cap production deploy)."
task :production do
  set :branch, "master"
  set :deploy_to, "/var/www/example/production"
end

desc "Deploys stage code (Usage: cap stage deploy)."
task :stage do
  set :branch, "stage"
  set :deploy_to, "/var/www/example/stage"
end

namespace :deploy do
  task :start do
  end
  
  task :stop do
  end
  
  task :restart, roles: :app, except: {no_release: true} do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :symlink_configs, roles: :app do
    %w(config/database.yml).each {|path| run "ln -nfs #{shared_path}/#{path} #{release_path}/#{path}"}
  end
end

after "bundle:install", "deploy:symlink_configs"
