module Items
  module DrunkModeDecorator
    def name
      self['name'].upcase.gsub(" ", "\t")
    end
  end
end