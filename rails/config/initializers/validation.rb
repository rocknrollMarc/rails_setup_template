# Customizes error message behavior.
ActionView::Base.field_error_proc = Proc.new {|html_tag, instance_tag| "<span class='field_error'>#{html_tag}</span>".html_safe}
