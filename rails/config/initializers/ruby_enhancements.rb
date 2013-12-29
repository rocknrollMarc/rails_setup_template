class Array
  # Works just like the compact method but also removes blanks in addition to nils.
  def compress
    self.compact.reject {|item| item.blank?}
  end
end

class BigDecimal
  # Better inspection, especially when testing.
  # Reference: https://gist.github.com/henrik/6280438
  def inspect
    format "#<BigDecimal:%x %s>", object_id, to_s('F')
  end
end
