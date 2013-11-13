
    # Block or throttle abusive clients.
    config.middleware.use Rack::Attack

    # Compress HTML, CSS, and JavaScript files.
    config.middleware.use Rack::Deflater

    # Conditionally force access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
    config.force_ssl = (ENV["HTTPS_ENABLED"] == "yes")

    # Enable concurrent threads.
    config.allow_concurrency = true

    # Override generator defaults
    config.generators do |generator|
      generator.assets false
      generator.helper false
      generator.view_specs false
      generator.test_framework :rspec
    end
