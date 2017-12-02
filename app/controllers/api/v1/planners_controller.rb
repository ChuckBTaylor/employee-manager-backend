class Api::V1::PlannersController < ApplicationController

  def index
    planners = Company.find(params[:company_id]).planners
    render json: planners
  end

  def create
    old_planner = Planner.last
    planner = Planner.new(monday: old_planner.monday + 1.weeks)
    if Company.find(params[:company_id]).planners << planner
      render json: planner
    else
      render json: {erros: planner.errors.full_messages}
    end
  end

  def show
    planner = Planner.find(params[:id])
    project_ids = planner.projects.map do |project|
      project.id
    end
    render json: {planner_id: planner.id, project_ids: project_ids}
  end

  def add_project
    planner = Planner.find(params[:planner][:id])
    planner.projects << Project.find(params[:planner][:project_id])
    render json: planner
  end

  def remove_project
    planner = Planner.find(params[:planner][:id])
    pp = PlannersProject.find_by(planner: planner, project_id: params[:planner][:project_id])
    PlannersProject.destroy(pp.id)
    render json: planner
  end

  private

  def planner_params
    params.require(:planner).permit(:id, :project_id, :project_ids)
  end


end
