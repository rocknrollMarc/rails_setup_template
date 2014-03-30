# Mini Profiler Settings
if Rails.env.development?
  # Start hidden - display with "OPTION+P".
  Rack::MiniProfiler.config.start_hidden = true

  # Auto-inject JavaScript support.
  Rack::MiniProfiler.config.auto_inject = false
end
