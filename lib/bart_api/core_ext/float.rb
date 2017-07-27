class Float
  def self.new numeric
    numeric.to_f if numeric.respond_to? :to_f
  end
end
