class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:edit, :update, :destroy]

  def new
    @shop = Shop.find(params[:shop_id])
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @shop = Shop.find(params[:shop_id])
    @schedule.shop = @shop
    if @schedule.save
      redirect_to shop_path(@shop)
    else
      render :new
    end
  end

  def edit
    @shop= Shop.find(@schedule.shop_id)
  end

  def update
    if @schedule.update(schedule_params)
      respond_to do |format|
        format.html { redirect_to shop_path(@schedule.shop) }
        format.json { render json: @schedule.to_json, status: 200}
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: "Upate has failed", status: 406}
      end
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to shop_path(@schedule.shop)
  end

  private

  def schedule_params
    params.require(:schedule).permit(:day, :closed, :opening, :closing, :midday_opening, :midday_closing, :shop_id)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end
