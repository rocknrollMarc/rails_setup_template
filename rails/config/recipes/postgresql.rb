set_default :postgresql_host, "localhost"
set_default(:postgresql_user) {Capistrano::CLI.ui.ask "Enter PostgreSQL user: "}
set_default(:postgresql_password) {Capistrano::CLI.password_prompt "Enter PostgreSQL password: "}
set_default(:postgresql_database) {"#{application}_#{env}"}

namespace :postgresql do
  desc "Install the latest stable release of PostgreSQL."
  task :install, roles: :db, only: {primary: true} do
    run "#{sudo} add-apt-repository ppa:pitti/postgresql"
    run "#{sudo} #{install_command} update"
    run "#{sudo} #{install_command} install postgresql libpq-dev"
  end
  after "deploy:install", "postgresql:install"

  desc "Create a database for application."
  task :create_database, roles: :db, only: {primary: true} do
    run %Q{#{sudo} -u postgres psql -c "create user #{postgresql_user} with password '#{postgresql_password}';"}
    run %Q{#{sudo} -u postgres psql -c "create database #{postgresql_database} owner #{postgresql_user};"}
  end
  after "deploy:setup", "postgresql:create_database"

  desc "Generate the database.yml configuration file."
  task :setup, roles: :app do
    run "mkdir -p #{shared_path}/config"
    template "postgresql.yml.erb", "#{shared_path}/config/database.yml"
  end
  after "deploy:setup", "postgresql:setup"

  desc "Symlink the database.yml file for latest release."
  task :symlink, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "postgresql:symlink"

  %w[start stop restart].each do |command|
    desc "#{command.capitalize} PostgreSQL."
    task command, roles: :db do
      run "#{sudo} service postgresql #{command}"
    end
  end
end
