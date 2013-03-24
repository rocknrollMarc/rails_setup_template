module DateTimeHelper
  # Renders the date and time in a given format. See
  # /config/initializers/date_time.rb for pre-defined formats.
  # ==== Parameters
  # * +date_time+ - The datetime object to be formatted.
  # * +format+ - The format to use, defaults to :default.
  def render_date_time date_time, format = :default
    raw(date_time.to_s(format)) if date_time
  end
  
  # Renders the date and time in a given format for the current user's time zone.
  # The default time zone is whatever is set in the environment.rb (i.e. UTC) when the current
  # user cannot be determined. See /config/initializers/date_time.rb for pre-defined formats.
  # ==== Parameters
  # * +date_time+ - The datetime object to be formatted.
  # * +format+ - The format to use, defaults to :default.
  def render_current_user_date_time date_time, format = :default
    date_time.in_time_zone(current_user.time_zone).to_s(format) if date_time && current_user
  end
  
  # Renders the date and time for a given object and method in human readable format. Also,
  # for readability purposes, methods suffixed with "at" will be replaced with "on" text. Example:
  # "Created at" becomes "Created on".
  # ==== Parameters
  # * +object+ - Required. The object to format.
  # * +method+ - Required. The object method to call.
  # * +method+ - Optional. The date/time format to use. Defaults to "hr_date_time".
  def render_date_time_for object, method, format = :hr_date_time
    raw([method.to_s.humanize.gsub(/\sat/, " on"), render_date_time(object.public_send(method), format)] * ' ')
  end
end
