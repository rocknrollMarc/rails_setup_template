module ActsAsListEnhancements
  module ClassMethods
    def move_position id, position
      if id.present? && position.present?
        union = find id
        if union.present?
          case position
          when "top" then union.move_to_top
          when "higher" then union.move_higher
          when "lower" then union.move_lower
          when "bottom" then union.move_to_bottom
          end
        end
      end
    end

    def reposition ids = []
      unless ids.empty?
    		ids.each_with_index {|id, index| update_all ["position=?", index + 1], ["id=?", id]}
      end
    end
  end
  
  def self.included base
    base.extend ClassMethods
  end
end

module ActsAsListControllerEnhancements
  module ClassMethods
    # Allows one to specify list options.
    # ==== Options
  	# * +model_class+ - Required. The model class.
  	# * +model_symbol+ - Required. The model symbol used to identify parameter keys.
    def acts_as_list_options options = {}
      @acts_as_list_options = options
      class_eval "class << self; attr_reader :acts_as_list_options end"
    end
  end
  
  module InstanceMethods
    def reposition
      debugger
      acts_as_list_options[:model_class].move_position params[:id], params[:position]
      acts_as_list_options[:model_class].reposition params[@acts_as_list_options[:model_symbol]] if params[@acts_as_list_options[:model_symbol]].present?
  		render :nothing => true
    end
  end
  
  def self.included base
    base.extend ClassMethods
  end
  include InstanceMethods  
end
