namespace :redis do
  desc "Install the latest stable release of redis."
  task :install, roles: :db, only: {primary: true} do
    run "#{sudo} add-apt-repository ppa:rwky/redis"
    run "#{sudo} #{install_command} update"
    run "#{sudo} #{install_command} install redis-server"
  end
  after "deploy:install", "redis:install"

  %w[start stop restart].each do |command|
    desc "#{command.capitalize} Redis."
    task command, roles: :db do
      run "#{sudo} service redis-server #{command}"
    end
  end
end
