class Backstage < Item
  def set_quantity
    if self.quality < 50
      case sell_in
      when -Float::INFINITY...0
        self.quality = self.quality = 0
      when 10...Float::INFINITY
        self.quality = self.quality + 1
      when 6...10
        self.quality = self.quality + 2
      when 1...5
        self.quality = self.quality + 3
      end
    end
  end
end
