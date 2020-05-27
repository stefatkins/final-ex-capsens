# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Item.create({name: "+5 Dexterity Vest", sell_in: 10, quality: 20})
Item.create({name: "Aged Brie", sell_in: 2, quality: 0})
Item.create({name: "Elixir of the Mongoose", sell_in: 5, quality: 7})
Item.create({name: "Sulfuras, Hand of Ragnaros", sell_in: 0, quality: 80})
Item.create({name: "Sulfuras, Hand of Ragnaros", sell_in: -1, quality: 80})
Item.create({name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 15, quality: 20})
Item.create({name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 10, quality: 49})
Item.create({name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 5, quality: 49})
# This Conjured item does not work properly yet
Item.create({name: "Conjured Mana Cake", sell_in: 3, quality: 6}) # <-- :O
