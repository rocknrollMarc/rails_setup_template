module NavigationHelper
	# Answers the role based on the namespace of the current controller. If no namespace is found
	# then "public" is used as the role. This is handy for situations where you have a role-based
	# menu structure. For example:
	# * shared/menus/_admin.html.erb
	# * shared/menus/_member.html.erb
	# * shared/menus/_public.html.erb
	def current_role
		namespace = controller.class.name
		namespace.include?("::") ? namespace[0, namespace.rindex("::")].downcase : "public"
	end
		
  # Shows a menu bar (unordered list) for page navigation based on an array
  # of menu item hashes.  The menu bar accepts the following options:
  # * *items* - The array of menu items.  See /helpers/renderer/menu_item.rb for more details.
  # * *ul_id* - The ul element CSS ID.
  # * *ul_class* - The ul element CSS class.
  def render_menu items, options = {}
    content_tag :ul, :id => options[:ul_id], :class => options[:ul_class] do
      items.map {|item| Renderers::MenuItem.new(item, controller, self).render}
    end
  end
  
  # Renders breadcrumb navigaion for nested pages.
  # * *crumbs* - The array of links, text, etc. to be displayed.
  def breadcrumbs *crumbs
    content_for :breadcrumbs, content_tag(:div, :id => "breadcrumbs") {crumbs.compact.join " &raquo; "}
  end

  # Renders submit and cancel links for a form.  Accepts an options hash with the
  # following keys:
  # * *submit_label* = The submit label, defaults to "Save".
  # * *submit_options* = The same hash as used with the submit_tag helper, defaults to {}.
  # * *cancel_label* = The cancel label, defaults to "Cancel".
  # * *cancel_options* = The same hash as used with the link_to helper, defaults to {}.
  # * *cancel_html_options* = The same hash as used with the link_to helper, defaults to {}.
  def render_submit_and_cancel options = {}
    options.reverse_merge! :submit_label => "Save", :submit_options => {}, :cancel_label => "Cancel", :cancel_options => :back, :cancel_html_options => {}
    "#{submit_tag options[:submit_label], options[:submit_options]} or #{link_to options[:cancel_label], options[:cancel_options], options[:cancel_html_options]}"
  end
end
