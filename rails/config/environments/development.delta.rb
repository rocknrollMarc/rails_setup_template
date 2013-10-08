

  # Web Console Settings
  config.web_console.style.colors = :xterm
  config.web_console.timeout = 45.seconds

  # SASS Debugging
  config.sass.debug_info = true

  # Bullet
  config.after_initialize do
    Bullet.enable = true
    Bullet.bullet_logger = true
    Bullet.console = true
  end
