worker_processes Integer(ENV.fetch("UNICORN_WORKERS", 3))
working_directory Dir.pwd
timeout Integer(ENV.fetch("UNICORN_TIMEOUT", 15))
preload_app true
FileUtils.mkdir_p "tmp/pids"
pid File.join(Dir.pwd, "tmp/pids/unicorn.pid")
stderr_path File.join(Dir.pwd, "log/unicorn.log")
stdout_path File.join(Dir.pwd, "log/unicorn.log")

before_fork do |server, worker|
  Signal.trap "TERM" do
    puts "Unicorn master intercepting TERM and sending myself QUIT instead."
    Process.kill "QUIT", Process.pid
  end

  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap "TERM" do
    puts "Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT."
  end

  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
