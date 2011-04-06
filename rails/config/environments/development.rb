

  # Phusion Passenger Debug Support
  if File.exists? File.join(Rails.root, "tmp", "debug.txt")
    require "ruby-debug"
    Debugger.wait_connection = true
    Debugger.start_remote
    File.delete File.join(Rails.root, "tmp", "debug.txt")
  end

  # Bullet Settings
  config.after_initialize do
    Bullet.enable = true
    Bullet.console = true
    Bullet.bullet_logger = true
    Bullet.rails_logger = true
    Bullet.disable_browser_cache = true
    begin
      require "ruby-growl"
      Bullet.growl = true
      Bullet.growl_password = {:password => "enter password"}
    rescue MissingSourceFile
      STDERR.puts "Unable to enable Growl support: #{$!}"
    end
  end

