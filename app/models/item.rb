class Item < ApplicationRecord
  attr_reader :drunk_mode
  validates :name, presence: true
  validates :sell_in, presence: true
  validates :quality, presence: true

  MAX_QUALITY = 50

   def next_day(price_calculator = Items::PriceCalculatorService.new)
    self.sell_in = sell_in - 1
    set_quantity if quality > 0
    self.price = price_calculator.(value: price) if sell_in < 0 
  end

   def next_day!
    next_day
    save!
  end

  def set_quantity
    if sell_in < 0
      self.quality = quality - 2
    else
      self.quality = quality - 1 
    end
  end
end
