class Conjured < Item
  def set_quantity
    self.quality = quality - 2
  end
end
