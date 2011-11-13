module NavigationHelper
	# Render a breadcrumb.
  def breadcrumb text, url = nil
    content_tag :li, (url ? link_to(text, url) : content_tag(:span, text))
  end

  # Render breadcrumb navigation.
  # * +crumbs+ - The breadcrumb array.
  def breadcrumbs *crumbs
    content_for :breadcrumbs, content_tag(:ul, (raw(crumbs.compact.join("\n"))), id: :breadcrumbs)
  end
end
