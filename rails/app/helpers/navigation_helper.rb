module NavigationHelper
  def breadcrumb text, url = nil
    content_tag :li, (url ? link_to(text, url) : content_tag(:span, text))
  end

  # Renders breadcrumb navigation.
  # * +crumbs+ - The breadcrumb array.
  def breadcrumbs *crumbs
    content_for :breadcrumbs, content_tag(:ul, (raw(crumbs.compact.join("\n"))), class: "breadcrumb")
  end

  def render_visitor_menu_left
    navigation "ul", class: "left" do
      item "Home", root_path
      item "About", about_path
    end
  end

  def render_visitor_menu_right
    navigation "ul", class: "right" do
      item "Login", login_path, {}, {class: "button tiny round"}
    end
  end
end
