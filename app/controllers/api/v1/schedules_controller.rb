class Api::V1::SchedulesController < ApplicationController

  def index
    schedules = Employee.find(params[:employee_id]).schedules
    render json: schedules
  end

  def show
    schedule = Schedule.find(params[:id])
    render json: schedule
  end

  def create
    schedule_info = params["schedule"]

    @schedule = Schedule.new(scheduled_start: DateTime.parse(schedule_info['scheduled_start']), scheduled_end: DateTime.parse(schedule_info['scheduled_end']), description: schedule_info['description'])
    if Employee.find(params['employee_id']).schedules << @schedule
      render json: @schedule
    else
      render json: {errors: @schedule.errors.full_messages}, status: 422
    end
  end

  def update
    schedule_info = params["schedule"]
    schedule = Schedule.find(schedule_info['id'])

    if schedule.update(scheduled_start: DateTime.parse(schedule_info['scheduled_start']), scheduled_end: DateTime.parse(schedule_info['scheduled_end']), description: schedule_info['description'])
      render json: schedule
    else
      render json: {errors: schedule.errors.full_messages}, status: 422
    end
  end


  def destroy
    Schedule.destroy(params['schedule']['id'])
    render json: Schedule.all
  end


end
