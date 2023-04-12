class SchedulesController < ApplicationController
  protect_from_forgery with: :null_session #deactivate CSRF protection to avoid "Can't verify CSRF token authenticit"
  before_action :set_schedule, only: [:show, :update, :destroy]

  def index
    render json: Schedule.all.to_json
  end

  def show
    render json: @schedule.to_json
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @shop = Shop.find(params[:shop_id])
    @schedule.shop = @shop
    if @schedule.save
      render json: @schedule.to_json, status: 200
    else
      render json: "Schedule's creation has failed", status: 406
    end
  end

  def update
    if @schedule.update(schedule_params)
      render json: @schedule.to_json, status: 200
    else
      render json: "Schedule's update has failed", status: 406
    end
  end

  def destroy
    if @schedule.destroy
      render json: "Schedule has been destroyed", status: 200
    else
      render json: "Schedule's destruction has failed", status: 406
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:day, :closed, :opening, :closing, :midday_opening, :midday_closing)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end
