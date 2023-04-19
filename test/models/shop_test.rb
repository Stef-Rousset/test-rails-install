require "test_helper"

class ShopTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should be valid if name is present" do
    shop = Shop.new(name: "bastille")
    assert shop.valid?
  end

  test "should be invalid if name is empty" do
    shop = Shop.new(name: "")
    assert_not shop.valid?
  end

  test "name should be unique" do
    shop = Shop.create(name: "bastille")
    shop_two = Shop.create(name: "bastille")
    assert_not shop_two.persisted? #persisted? retruns true if the record is persisted
  end
end
