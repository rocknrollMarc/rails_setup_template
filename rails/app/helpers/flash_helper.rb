module FlashHelper
  # Renders all flash messages.
  def render_flash_messages
    unless flash.empty?
      content_tag :div, class: "flash-block" do
        flash.map do |type, message|
          render_flash type, message
        end
      end
    end
  end
  
  # Renders a single flash message.
  def render_flash type, message
    content_tag :div, message, class: "flash #{type}"
  end
end
