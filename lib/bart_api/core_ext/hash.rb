class Hash
  def deep_merge hash
    self.merge hash do |k, a, b| 
      if a.respond_to? :merge and b.respond_to? :merge
        a.merge b
      else
        b
      end
    end
  end
end
