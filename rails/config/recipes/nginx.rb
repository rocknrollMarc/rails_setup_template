set_default :nginx_root, "/etc/nginx"

namespace :nginx do
  desc "Installs latest Nginx stable release."
  task :install, roles: :web do
    run "#{sudo} add-apt-repository ppa:nginx/stable"
    run "#{sudo} #{install_command} update"
    run "#{sudo} #{install_command} install nginx"
  end
  after "deploy:install", "nginx:install"

  desc "Sets up Nginx configuration for application."
  task :setup, roles: :web do
    run "#{sudo} rm -f #{nginx_root}/sites-enabled/default"
    run "#{sudo} rm -f #{nginx_root}/sites-available/default"
    template "nginx.site.erb", "/tmp/nginx.site"
    run "#{sudo} mv /tmp/nginx.site #{nginx_root}/sites-available/#{application}.#{env}"
    run "#{sudo} ln -fs #{nginx_root}/sites-available/#{application}.#{env} #{nginx_root}/sites-enabled/#{application}.#{env}"
    restart
  end
  after "deploy:setup", "nginx:setup"

  %w[start stop restart].each do |command|
    desc "#{command.capitalize} Nginx."
    task command, roles: :web do
      run "#{sudo} service nginx #{command}"
    end
  end
end
