module NavigationHelper
  def breadcrumb text, url = nil
    content_tag :li, (url ? link_to(text, url) : content_tag(:span, text))
  end

  # Renders breadcrumb navigation.
  # * +crumbs+ - The breadcrumb array.
  def breadcrumbs *crumbs
    content_for :breadcrumbs, content_tag(:ul, (raw(crumbs.compact.join("\n"))), class: "breadcrumb")
  end

  def render_visitor_menu
    navigation "nav", class: "top-bar", "data-topbar" => nil do
      ul nil, class: "title-area" do
        li nil, class: "name" do
          h1 do
            a SYSTEM_LABEL, href: root_path
          end
        end
      end

      section nil, class: "top-bar-section" do
        ul nil, class: "left" do
          item "Home", root_path
          item "About", about_path
        end

        ul nil, class: "right" do
          item render_system_version, '#'
        end

        ul nil, class: "right" do
          item "Login", login_path, {}, {class: "button tiny round"}
        end
      end
    end
  end
end
