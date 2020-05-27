module Items
  class NextDayService
    def call(items:)
      items.each do |item|
        item.next_day!
      end
    end
  end
end