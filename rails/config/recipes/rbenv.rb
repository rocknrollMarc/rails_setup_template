set_default :ruby_version, "1.9.3-p392"
set_default :ruby_url, "http://ftp.ruby-lang.org/pub/ruby/1.9"

namespace :rbenv do
  desc "Install rbenv, Ruby, and the Bundler gem"
  task :install, roles: :app do
    # Ruby
    ruby_version_path = "ruby_source/ruby-#{ruby_version}"
    run "git clone git://github.com/sstephenson/rbenv.git .rbenv"
    run "mkdir ruby_source"
    run "cd ruby_source && curl -O #{ruby_url}/ruby-#{ruby_version}.tar.gz"
    run "cd ruby_source && tar -xzvf ruby-#{ruby_version}.tar.gz"
    run "cd #{ruby_version_path} && ./configure --prefix=/home/#{user}/.rbenv/versions/#{ruby_version}"
    run "cd #{ruby_version_path} && make"
    run "cd #{ruby_version_path} && make install"
    run "mv .bashrc .bashrc.old"
    run "echo 'export PATH=\"$HOME/.rbenv/bin:$PATH\"' > .bashrc"
    run "echo 'eval \"$(rbenv init -)\"' >> .bashrc"
    run "rbenv global #{ruby_version}"
    run "rm -rf ruby_source"

    # Dotfiles
    run "git clone git://github.com/bkuhlmann/dotfiles.git"
    run "rm -f .profile .bashrc && cd dotfiles && ruby install.rb"
    run "rm -rf dotfiles"

    # Gems
    run "gem update --system"
    run "gem install bundler"
    run "gem install wirble"
    run "gem install hirb"
    run "gem install awesome_print"
  end
  after "deploy:install", "rbenv:install"
end
