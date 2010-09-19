module TextHelper
  # Renders clean, html-escaped, Textile text.
  # ==== Parameters
  # * +text+ - The raw text to render as Textile text.
  def render_textile text
  	sanitize(RedCloth.new(text, [:filter_html, :no_span_caps]).to_html) if text.present?
  end
end

