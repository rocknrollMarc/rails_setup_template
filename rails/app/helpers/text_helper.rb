module TextHelper
  # Renders clean, html-escaped, Textile text.
  def render_textile text
		RedCloth.new(text, [:filter_html, :no_span_caps]).to_html
  end
end