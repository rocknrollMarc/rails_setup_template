
  # Enables web console long-polling.
  config.web_console.timeout = 45.seconds

  # Enables web console xterm colors.
  config.web_console.style.colors = :xterm

  # SASS Debugging
  config.sass.debug_info = true

  # Bullet
  config.after_initialize do
    Bullet.enable = true
    Bullet.bullet_logger = true
    Bullet.console = true
  end
