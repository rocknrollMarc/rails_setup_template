set_default(:unicorn_user) {user}
set_default(:unicorn_pid) {"#{current_path}/tmp/pids/unicorn.pid"}
set_default(:unicorn_config) {"#{shared_path}/config/unicorn.rb"}
set_default(:unicorn_log) {"#{shared_path}/log/unicorn.log"}
set_default :unicorn_workers, 2

namespace :unicorn do
  desc "Setup Unicorn initializer and app configuration."
  task :setup, roles: :app do
    run "mkdir -p #{shared_path}/config"
    template "unicorn.rb.erb", unicorn_config
    template "unicorn.service.erb", "/tmp/unicorn.service"
    run "chmod +x /tmp/unicorn.service"
    run "#{sudo} mv /tmp/unicorn.service /etc/init.d/unicorn.#{application}.#{env}"
    run "#{sudo} update-rc.d -f unicorn.#{application}.#{env} defaults"
  end
  after "deploy:setup", "unicorn:setup"

  %w[start stop restart].each do |command|
    desc "#{command.capitalize} Unicorn."
    task command, roles: :app do
      run "service unicorn.#{application}.#{env} #{command}"
    end
    after "deploy:#{command}", "unicorn:#{command}"
  end
end
