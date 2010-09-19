module ImageHelper
  def render_image_for target, options = {}
    options.reverse_merge! :method => :image, :style => :small
    image_file_name = options[:method].to_s + "_file_name"
    if target.try(image_file_name).present?
      image_tag target.send(options[:method]).url(options[:style]), :id => options[:id], :alt => target.send(image_file_name)
    else
      image_tag '', :id => options[:id], :alt => "Image Unavailable"
    end
  end  
end
