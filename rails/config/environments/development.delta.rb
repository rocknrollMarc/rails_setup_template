

  # Phusion Passenger Debug Support
  if File.exists? File.join(Rails.root, "tmp", "debug.txt")
    require "ruby-debug"
    Debugger.wait_connection = true
    Debugger.start_remote
    File.delete File.join(Rails.root, "tmp", "debug.txt")
  end
