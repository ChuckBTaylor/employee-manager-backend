class Api::V1::SchedulesController < ApplicationController

  def index
    schedules = Employee.find(params[:employee_id]).schedules
    render json: schedules
  end

  def show
    schedule = Schedule.find(params[:id])
    render json: schedule
  end


end
