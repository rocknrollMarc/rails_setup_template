class Array
  # Works just like the compact method but also removes blanks in addition to nils.
  def compress
    self.compact.reject {|item| item.blank?}
  end
end
