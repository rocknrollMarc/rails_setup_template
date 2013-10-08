
    # Enable concurrent threads.
    config.allow_concurrency = true

    # Block or throttle abusive clients.
    config.middleware.use Rack::Attack

    # Override generator defaults
    config.generators do |generator|
      generator.assets false
      generator.helper false
      generator.view_specs false
      generator.test_framework :rspec
    end
