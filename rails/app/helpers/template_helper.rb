module TemplateHelper
  # Template placeholder.
  def render_account_header_info
    raw link_to("Login", root_path) + " | " + link_to("Register", root_path)
  end
  
  # Template placeholder.
  def current_route
    "visitor"
  end  
end
