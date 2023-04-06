class ShopsController < ApplicationController
  before_action :set_shops, only: [:show]

  def index
    @shops = Shop.all
  end

  def show
    @schedules = Schedule.sort_schedules(@shop.schedules)
  end

  private

  def set_shops
    @shop = Shop.find(params[:id])
  end
end
