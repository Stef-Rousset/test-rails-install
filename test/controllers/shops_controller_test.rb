require "test_helper"

class ShopsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get root url" do
    get root_path
    assert_response :success
  end
end
