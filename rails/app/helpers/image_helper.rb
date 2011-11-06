module ImageHelper
	# Render image for given target.
	# ==== Parameters
  # * +name+ - Optional. The name of the file attachment. Defaults to :image.
  # * +style+ - Optional. The style to render the image as. Defaults to :thumb.
  # * +id+ - Optional. The HTML ID attribute. Defaults to nil.
  # * +alt+ - Optional. The alternative message to display when no image if found. Defaults to "Missing".
  def render_image_for target, options = {}
    options.reverse_merge name: :image, style: :thumb, alt: "Missing"
    file_name = options[:name].to_s + "_file_name"
    if target.respond_to?(file_name) && target.send(file_name).present?
      image_tag target.send(options[:name]).url(options[:style]), id: options[:id], alt: target.send(file_name)
    else
      image_tag "missing.png", id: options[:id], alt: options[:alt]
    end
  end
end
