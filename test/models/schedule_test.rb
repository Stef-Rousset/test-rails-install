require "test_helper"

class ScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should be valid if day is present and closed is true" do
    shop = Shop.create!(name: "bastille")
    schedule = Schedule.new(day: 0, shop_id: shop.id, closed: true)
    assert schedule.valid?
  end

  test "should be invalid if day is absent and closed is true" do
    shop = Shop.create!(name: "bastille")
    schedule = Schedule.new(shop_id: shop.id, closed: true)
    assert_not schedule.valid?
  end

   test "day shoud be unique for the same shop" do
    shop = Shop.create!(name: "bastille")
    schedule = Schedule.create(shop_id: shop.id, day: 0, closed: true)
    schedule_two = Schedule.create(shop_id: shop.id, day: 0, closed: true)
    assert_not schedule_two.persisted?
  end

  test "should be valid if day and opening and closing are present, and closed is false" do
    shop = Shop.create!(name: "bastille")
    schedule = Schedule.new(day: 0, shop_id: shop.id, closed: false, opening: DateTime.new(2023,4,4,10,30), closing: DateTime.new(2023,4,4,18))
    assert schedule.valid?
  end

  test "should be invalid if opening and closing are not present, and closed is false" do
    shop = Shop.create!(name: "bastille")
    schedule = Schedule.new(day: 0, shop_id: shop.id, closed: false)
    assert_not schedule.valid?
  end

  test "should be valid if day,opening, closing, midday_opening and midday_closing are present, and closed is false" do
    shop = Shop.create!(name: "bastille")
    schedule = Schedule.new(day: 0, shop_id: shop.id, closed: false, opening: DateTime.new(2023,4,4,10,30), closing: DateTime.new(2023,4,4,18), midday_closing: DateTime.new(2023,4,4,13), midday_opening: DateTime.new(2023,4,4,14))
    assert schedule.valid?
  end

  test "should be invalid if midday_opening is present and midday_closing is absent, and closed is false" do
    shop = Shop.create!(name: "bastille")
    schedule = Schedule.new(day: 0, shop_id: shop.id, closed: false, opening: DateTime.new(2023,4,4,10,30), closing: DateTime.new(2023,4,4,18), midday_closing: DateTime.new(2023,4,4,13))
    assert_not schedule.valid?
  end

  test "schedules should be sorted with first schedule equal to current day" do
    current_day = Date.today.strftime('%A')
    shop = Shop.create!(name: "bastille")
    0.upto(6) do |number|
    Schedule.create(shop_id: shop.id, day: number, closed: true)
    end
    day = Schedule.sort_schedules(shop.schedules).first.day
    assert_equal day, current_day
  end
end
