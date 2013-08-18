if defined?(Footnotes) && Rails.env.development?
  Footnotes.run!

  # Open URLs in Sublime Text (requires the Sublime Text URL Handler app: https://github.com/asuth/subl-handler).
  Footnotes::Filter.prefix = "subl://open?url=file://%s&line=%d&column=%d"
end
