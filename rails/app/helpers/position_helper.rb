module PositionHelper
  # Renders the drag-n-drop icon.
  # ==== Parameters
  # * +tag+ - Optional. The HTML element. Defaults to "span".
  # * +text+ - Optional. The HTML element text. Default to '.'.
  # * +options+ - Optional. Supports the same option hash as supported by the content_tag helper.
  def render_position_move tag = :span, text = '.', options = {}
    options.reverse_merge! :class => "move ui-icon ui-icon-arrow-4 img-center"
    content_tag tag, text, :class => options[:class]
  end

  # Renders the move to top icon.
  # ==== Parameters
  # * +tag+ - Optional. The HTML element. Defaults to "span".
  # * +text+ - Optional. The HTML element text. Default to '.'.
  # * +options+ - Optional. Supports the same option hash as supported by the content_tag helper.
  def render_position_top tag = :span, text = '.', options = {}
    options.reverse_merge! :class => "top ui-icon ui-icon-arrowthickstop-1-n img-center"
    content_tag tag, text, :class => options[:class]
  end

  # Renders the move higher icon.
  # ==== Parameters
  # * +tag+ - Optional. The HTML element. Defaults to "span".
  # * +text+ - Optional. The HTML element text. Default to '.'.
  # * +options+ - Optional. Supports the same option hash as supported by the content_tag helper.
  def render_position_higher tag = :span, text = '.', options = {}
    options.reverse_merge! :class => "higher ui-icon ui-icon-arrowthick-1-n img-center"
    content_tag tag, text, :class => options[:class]
  end

  # Renders the move lower icon.
  # ==== Parameters
  # * +tag+ - Optional. The HTML element. Defaults to "span".
  # * +text+ - Optional. The HTML element text. Default to '.'.
  # * +options+ - Optional. Supports the same option hash as supported by the content_tag helper.
  def render_position_lower tag = :span, text = '.', options = {}
    options.reverse_merge! :class => "lower ui-icon ui-icon-arrowthick-1-s img-center"
    content_tag tag, text, :class => options[:class]
  end

  # Renders the move to bottom icon.
  # ==== Parameters
  # * +tag+ - Optional. The HTML element. Defaults to "span".
  # * +text+ - Optional. The HTML element text. Default to '.'.
  # * +options+ - Optional. Supports the same option hash as supported by the content_tag helper.
  def render_position_bottom tag = :span, text = '.', options = {}
    options.reverse_merge! :class => "bottom ui-icon ui-icon-arrowthickstop-1-s img-center"
    content_tag tag, text, :class => options[:class]
  end

  # Renders the drag-n-drop, move to top, move higher, move lower, and move to bottom icons.
  def render_position_control
    content_tag :div, :class => "position" do
      raw [render_position_move, render_position_top, render_position_higher, render_position_lower, render_position_bottom].join('')
    end
  end
end
