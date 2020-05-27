class Item < ApplicationRecord
  validates :name, presence: true
  validates :sell_in, presence: true
  validates :quality, presence: true

  MAX_QUALITY = 50

   def next_day
    self.sell_in = sell_in - 1
    set_quantity if quality > 0
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
