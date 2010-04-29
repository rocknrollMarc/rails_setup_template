namespace :heroku do
	# Original code located here: http://railspikes.com/2010/2/13/rake-task-for-deploying-to-heroku
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
	
	# Original code located here: http://almosteffortless.com/2010/04/14/automated-heroku-backups/
  desc "PostgreSQL database backups from Heroku to Amazon S3"
  task :backup => :environment do
    begin
      require 'right_aws'
      puts "[#{Time.now}] heroku:backup started"
      name = "#{ENV['APP_NAME']}-#{Time.now.strftime('%Y-%m-%d-%H%M%S')}.dump"
      db = ENV['DATABASE_URL'].match(/postgres:\/\/([^:]+):([^@]+)@([^\/]+)\/(.+)/)
      system "PGPASSWORD=#{db[2]} pg_dump -Fc --username=#{db[1]} --host=#{db[3]} #{db[4]} > tmp/#{name}"
      s3 = RightAws::S3.new(ENV['s3_access_key_id'], ENV['s3_secret_access_key'])
      bucket = s3.bucket("#{ENV['APP_NAME']}-heroku-backups", true, 'private')
      bucket.put(name, open("tmp/#{name}"))
      system "rm tmp/#{name}"
      puts "[#{Time.now}] heroku:backup complete"
    # rescue Exception => e
    #   require 'toadhopper'
    #   Toadhopper(ENV['hoptoad_key']).post!(e)
    end
  end
end

task :cron => :environment do
  Rake::Task['heroku:backup'].invoke
end