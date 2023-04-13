require "test_helper"

class ShopsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end


  test "should get root url" do
    get root_path
    assert_response :success
  end

  test "show should render json if format is json" do
    get shop_path(Shop.first), as: :json #as json request
    json_response = JSON.parse(response.body)
    assert_response :success
    assert_equal Shop.first.schedules.to_json, @response.body
  end

end
