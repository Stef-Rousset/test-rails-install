# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "deleting shops and schedules"
Shop.destroy_all
Schedule.destroy_all
p "creating shops"
shop_one = Shop.create!(name: "République")
shop_two = Shop.create!(name: "Opéra")
p "shops done"

p "creating schedules for shop_one"
schedule_one = Schedule.create!(shop_id: shop_one.id, day: 1, opening: DateTime.new(2023,4,4,10,30),closing: DateTime.new(2023,4,4,18))
schedule_two = Schedule.create!(shop_id: shop_one.id, day: 2, opening: DateTime.new(2023,4,4,10,30),closing: DateTime.new(2023,4,4,18))
schedule_three = Schedule.create!(shop_id: shop_one.id, day: 3, opening: DateTime.new(2023,4,4,10),closing: DateTime.new(2023,4,4,20))
schedule_four = Schedule.create!(shop_id: shop_one.id, day: 4, opening: DateTime.new(2023,4,4,10), midday_closing: DateTime.new(2023,4,4,13),midday_opening: DateTime.new(2023,4,4,14),closing: DateTime.new(2023,4,4,18))
schedule_five = Schedule.create!(shop_id: shop_one.id, day: 5, opening: DateTime.new(2023,4,4,10), midday_closing: DateTime.new(2023,4,4,13),midday_opening: DateTime.new(2023,4,4,14),closing: DateTime.new(2023,4,4,18))
schedule_six = Schedule.create!(shop_id: shop_one.id, day: 6, opening: DateTime.new(2023,4,4,10),closing: DateTime.new(2023,4,4,20))
schedule_seven = Schedule.create!(shop_id: shop_one.id, day: 7, closed: true)
p "creating schedules for shop_two"
schedule_one_bis = Schedule.create!(shop_id: shop_two.id, day: 1, closed: true)
schedule_two_bis = Schedule.create!(shop_id: shop_two.id, day: 2, opening: DateTime.new(2023,4,4,10), midday_closing: DateTime.new(2023,4,4,13),midday_opening: DateTime.new(2023,4,4,14),closing: DateTime.new(2023,4,4,18))
schedule_three_bis = Schedule.create!(shop_id: shop_two.id, day: 3, opening: DateTime.new(2023,4,4,10),closing: DateTime.new(2023,4,4,20))
schedule_four_bis = Schedule.create!(shop_id: shop_two.id, day: 4, opening: DateTime.new(2023,4,4,10), midday_closing: DateTime.new(2023,4,4,13),midday_opening: DateTime.new(2023,4,4,14),closing: DateTime.new(2023,4,4,18))
schedule_five_bis = Schedule.create!(shop_id: shop_two.id, day: 5, opening: DateTime.new(2023,4,4,10), midday_closing: DateTime.new(2023,4,4,13),midday_opening: DateTime.new(2023,4,4,14),closing: DateTime.new(2023,4,4,18))
schedule_six_bis = Schedule.create!(shop_id: shop_two.id, day: 6, opening: DateTime.new(2023,4,4,10),closing: DateTime.new(2023,4,4,20))
schedule_seven_bis = Schedule.create!(shop_id: shop_two.id, day: 7, opening: DateTime.new(2023,4,4,14),closing: DateTime.new(2023,4,4,20))
p "schedules done"
