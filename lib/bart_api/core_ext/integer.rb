class Integer
  def self.new numeric
    numeric.to_i if numeric.respond_to? :to_i
  end
end
