# Original code found at: http://railspikes.com/2010/2/13/rake-task-for-deploying-to-heroku
desc "Deploy to Heroku. Pass APP=appname to deploy to a different app."
task :deploy do
  require "heroku"
  require "heroku/command"
  
  user, pass = File.read(File.expand_path("~/.heroku/credentials")).split("\n")
  heroku = Heroku::Client.new user, pass

  cmd = Heroku::Command::BaseWithApp.new []
  remotes = cmd.git_remotes(File.dirname(__FILE__) + "/../..")

  remote, app = remotes.detect {|key, value| value == (ENV['APP'] || cmd.app)}

  raise "Could not find a git remote for the '#{ENV['APP']}' app" if remote.nil?

  "git push #{remote} master"

  heroku.rake app, "db:migrate"
  heroku.restart app
end
