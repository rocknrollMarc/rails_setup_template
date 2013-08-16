# SASS Debugging
config.sass.debug_info = true

# Bullet
config.after_initialize do
  Bullet.enable = true
  Bullet.bullet_logger = true
  Bullet.console = true
end
