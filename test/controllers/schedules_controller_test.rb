require "test_helper"

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get index" do
    get schedules_path
    assert_response :success
  end

  test "show should render schedule in json format" do
    shop = Shop.first
    schedule = shop.schedules.first
    get shop_schedule_path(shop, schedule), as: :json #as json request
    assert_response :success
    assert_equal schedule.to_json, @response.body
  end

  test "successfull create" do
    shop = Shop.create(name: "Nation")
    assert_equal 0, shop.schedules.size
    post shop_schedules_path(shop), params: { schedule: {day: "Monday", closed: true} }
    assert_response :success
    shop.reload
    assert_equal 1, shop.schedules.size
    assert_equal true, shop.schedules.first.closed
  end

  test "succesfull update" do
    shop = Shop.create(name: "Nation")
    schedule = Schedule.create(shop_id: shop.id, day: 0, closed: true)
    patch shop_schedule_path(shop, schedule), params: {schedule: {day: "Monday"}}
    schedule.reload
    assert_response :success
    assert_equal "Monday", schedule.day
  end

  test "successfull destroy" do
    shop = Shop.create(name: "Nation")
    schedule = Schedule.create(shop_id: shop.id, day: 0, closed: true)
    assert_equal 1, shop.schedules.size
    delete schedule_path(schedule)
    assert_response :success
    assert_equal "Schedule has been destroyed", @response.body
    assert_equal 0, shop.schedules.size
  end
end
