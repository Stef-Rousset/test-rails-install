class ShopsController < ApplicationController
  before_action :set_shops, only: [:show]

  def index
    @shops = Shop.all
  end

  def show
    @schedules = Schedule.sort_schedules(@shop.schedules)
    if @schedules.present?
      respond_to do |format|
        format.html
        format.json { render json: @schedules.to_json, status: 200 }
      end
    else
      respond_to do |format|
        format.html
        format.json { render json: "This shop has no schedule yet", status: 404 }
      end
    end
  end

  private

  def set_shops
    @shop = Shop.find(params[:id])
  end
end
