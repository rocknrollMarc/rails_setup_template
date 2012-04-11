require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/rbenv"
load "config/recipes/postgresql"
load "config/recipes/redis"
load "config/recipes/nginx"

set :application, "example"
set :user, "dev"
set :use_sudo, false

set :scm, "git"
set :repository, "git@www.example.com:#{application}.git"

role :web, "www.example.com"
role :app, "www.example.com"
role :db,  "www.example.com", :primary => true

set :deploy_via, :remote_cache
set :keep_releases, 10

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

desc "Deploys production environment (Usage: cap production deploy)."
task :production do
  set :env, "production"
  set :branch, "master"
  set :deploy_to, "/home/#{user}/apps/#{application}/#{env}"
end

desc "Deploys stage environment (Usage: cap stage deploy)."
task :stage do
  set :env, "stage"
  set :branch, "stage"
  set :deploy_to, "/home/#{user}/apps/#{application}/#{env}"
end

namespace :deploy do
  task :start do
  end
  
  task :stop do
  end
  
  task :restart, roles: :app, except: {no_release: true} do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after "deploy:update_code", "deploy:migrate"