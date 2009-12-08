# Bullet Settings
config.after_initialize do
  Bullet.enable = true
  Bullet.alert = true
  Bullet.bullet_logger = true
  Bullet.console = true
  begin
    require "ruby-growl"
    Bullet.growl = true
    Bullet.growl_password = "GXzsP2dh)Q93H.fE!Rux"
  rescue MissingSourceFile
    STDERR.puts "Unable to enable Growl support: #{$!}"
  end
  Bullet.rails_logger = true
  Bullet.disable_browser_cache = true
end
