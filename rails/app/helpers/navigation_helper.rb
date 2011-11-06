module NavigationHelper
	# Answer the current route for account navigation within the site. This is based on the type and role of the current
	# user. Routing is broken down into three sections which loads the correct controller and navigation menu. For example:
	# * shared/menus/_admin.html.erb
	# * shared/menus/_member.html.erb
	# * shared/menus/_visitor.html.erb
	def current_route
	  if current_user
  	  case current_user.type
      when "Employee" then "admin"
      when "Customer" then "member"
      else "visitor"
      end
    else
      "visitor"
    end
	end
	
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
