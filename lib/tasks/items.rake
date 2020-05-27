namespace :items do
  desc "updates item types"
  task update_types: :environment do
    items_hash = {
      "Aged Brie"  => 'AgedBrie',
      "Sulfuras, Hand of Ragnaros"  => 'Sulfuras',
      "Backstage passes to a TAFKAL80ETC concert"  => 'Backstage',
      "Conjured Mana Cake"  => 'Conjured'
    }
    Item.all.each {|i| i.update(type: items_hash[i.name]) }
  end

end
