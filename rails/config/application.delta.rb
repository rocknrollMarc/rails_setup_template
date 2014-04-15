
    # Add Modernizr to assets precompile path.
    config.assets.precompile += %w(modernizr)

    # Block or throttle abusive clients.
    config.middleware.use Rack::Attack

    # Compress HTML, CSS, and JavaScript files.
    config.middleware.use Rack::Deflater

    # Conditionally force access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
    config.force_ssl = (ENV["HTTPS_ENABLED"] == "yes")

    # Enable concurrent threads.
    config.allow_concurrency = true

    # Enable mem cache.
    config.cache_store = :mem_cache_store
