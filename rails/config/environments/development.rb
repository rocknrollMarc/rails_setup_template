

# Gems
config.gem "bullet"
config.gem "deadweight"
config.gem "railroad", :lib => false

# Phusion Passenger Debug Support
if File.exists? File.join(RAILS_ROOT, "tmp", "debug.txt")
  require "ruby-debug"
  Debugger.wait_connection = true
  Debugger.start_remote
  File.delete File.join(RAILS_ROOT, "tmp", "debug.txt")
end

# Bullet Settings
config.after_initialize do
  Bullet.enable = true
  Bullet.alert = true
  Bullet.console = true
  Bullet.bullet_logger = true
  Bullet.rails_logger = true
  Bullet.disable_browser_cache = true
  begin
    require "ruby-growl"
    Bullet.growl = true
    Bullet.growl_password = "enter your password here"
  rescue MissingSourceFile
    STDERR.puts "Unable to enable Growl support: #{$!}"
  end
end
