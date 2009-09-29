# Renders a navigational menu item complete with proper selection (if apt). A menu
# item hash may consist of the following:
# * *li_id* - The li element CSS ID (a.k.a. the controller name).
# * *li_class* - The li element CSS class.
# * *a_label* - The a element label.
# * *a_url_options* - The a elment URL options (same hash as used with the link_to helper).
# * *a_html_options* - The a element HTML options (same hash as used with the link_to helper).
class Renderers::MenuItem
  def initialize(item, controller, template)
    @item = item
    @controller = controller
    @template = template
    @item.reverse_merge! :a_label => @item[:li_id] ? @item[:li_id].capitalize : "Undefined"
  end
  
  # Renders the list item containing a hyperlink (a.k.a. menu item).
  def render
    compute_selection
    content_tag('li', link_to(@item[:a_label], @item[:a_url_options], @item[:a_html_options]), :id => @item[:li_id], :class => @item[:li_class])
  end
  
  # Punts to the helper context for helper methods not defined in this class.
  def method_missing *args, &block
    @template.send *args, &block
  end
  
  private
  
  # Determines whether a menu item is selected or not and styles it accordingly.
  def compute_selection
		id = (@item[:li_id] || '').split('_').last
		name = @controller.class.to_s.underscore.gsub(/[\/]/, '_').chomp("_controller")
		if id == params[:id]
			# Select specific resource (i.e. public_pages_1 == /public/pages/1)
	    if @item[:li_id] == [name, params[:id]].compact * '_'
	      @item[:li_class] = @item[:li_class] ? @item[:li_class] + ' active' : 'active'
	    end
		else
			# Select generic resource (i.e. public_home == /public/home)
	    if @item[:li_id] == name
	      @item[:li_class] = @item[:li_class] ? @item[:li_class] + ' active' : 'active'
	    end
		end
  end
end
