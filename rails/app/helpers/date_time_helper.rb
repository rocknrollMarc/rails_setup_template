module DateTimeHelper
  # Renders the date and time in a given format.  See
  # /config/initializers/date_time.rb for pre-defined formats.
  # * *date_time* - The datetime object to be formatted.
  # * *format* - The format to use, defaults to :default.
  def render_date_time date_time, format = :default
    date_time.to_s(format) if date_time
  end
  
  # Renders the date and time in a given format for the current user's time zone.
  # The default time zone is whatever is set in the environment.rb (i.e. UTC) when the current
  # user cannot be determined. See /config/initializers/date_time.rb for pre-defined formats.
  # * *date_time* - The datetime object to be formatted.
  # * *format* - The format to use, defaults to :default.
  def render_current_user_date_time date_time, format = :default
    date_time.in_time_zone(current_user.time_zone).to_s(format) if date_time && current_user
  end
end
