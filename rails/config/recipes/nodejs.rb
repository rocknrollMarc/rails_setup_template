namespace :nodejs do
  desc "Installs the latest relase of Node.js."
  task :install, roles: :app do
    run "#{sudo} add-apt-repository ppa:chris-lea/node.js"
    run "#{sudo} apt-get -y update"
    run "#{sudo} apt-get -y install nodejs"
  end
  after "deploy:install", "nodejs:install"
end
