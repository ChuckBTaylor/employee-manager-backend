class Api::V1::PlannersController < ApplicationController

  def index
    planners = Company.find(params[:company_id]).planners
    render json: planners
  end

  def show
    year = params[:id][0..3].to_i
    month = params[:id][4..5].to_i
    day = params[:id][6..7].to_i
    date = Date.new(year, month, day).beginning_of_week
    planner = Planner.find_by(monday: date)
    projects_ids = planner.projects.map do |project|
      project.id
    end
    render json: projects_ids
  end

end
