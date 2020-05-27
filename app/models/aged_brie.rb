class AgedBrie < Item
  def set_quantity
    self.quality = quality + 1 if quality < MAX_QUALITY
  end
end
