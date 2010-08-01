# Original inspiration found here: http://chrisadams.me.uk/2009/04/28/how-to-set-up-a-debugger-with-mod_railspassenger/

desc "Restarts the app when running via Phusion Passenger."
task :restart do
  system "touch tmp/restart.txt"
end

desc "Restarts the app with debug support enabled when running via Phusion Passenger. Use 'rdebug -c' from a terminal to attach to the debugger."
task :debug => [:restart] do
  system "touch tmp/debug.txt"
end
