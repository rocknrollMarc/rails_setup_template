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
    content_tag :li do
      url ? link_to(text, url) : content_tag(:span, text)
    end
  end

  # Render breadcrumb navigation.
  # * +crumbs+ - The breadcrumb array.
  def breadcrumbs *crumbs
    content_for :breadcrumbs, content_tag(:ul, :id => "breadcrumbs") {raw crumbs.compact}
  end

  # Renders submit and cancel links for a form.
  # ==== Options
  # * *submit_label* = Optional. The submit label. Defaults to "Save".
  # * *submit_options* = Optional. The same hash as used with the submit_tag helper. Defaults to {:class => :button}.
  # * *delimiter* = Optional. The text between the save and cancel links. Default to ' '.
  # * *cancel_label* = Optional. The cancel label. Defaults to "Cancel".
  # * *cancel_options* = Optional. The same hash as used with the link_to helper. Defaults to {}.
  # * *cancel_html_options* = Optional. The same hash as used with the link_to helper. Defaults to {:class => "button ui-button-cancel"}.
  def render_submit_and_cancel options = {}
    options.reverse_merge! :submit_label => "Save", :submit_options => {:class => :button}, :delimiter => ' ', :cancel_label => "Cancel", :cancel_options => :back, :cancel_html_options => {:class => "button ui-button-cancel"}
    html = ''
    html << submit_tag(options[:submit_label], options[:submit_options])
    html << options[:delimiter]
    html << link_to(options[:cancel_label], options[:cancel_options], options[:cancel_html_options])
    raw html
  end
end
