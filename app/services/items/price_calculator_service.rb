module Items
  class PriceCalculatorService
    DEFAULT_PERCENTAGE = 0.80 

    def call(value:)
      value * DEFAULT_PERCENTAGE
    end
  end
end