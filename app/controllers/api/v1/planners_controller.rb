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
    render json: {planner_id: planner.id, pps: planner.pps, operations: planner.operations}
  end

  def update
    planner = Planner.find(planner_params[:id])
    if planner.update(allotted_time: planner_params[:allotted_time])
      render json: planner
    else
      render json: {errors: planner.errors.full_messages}, stats: 422
    end
  end

  private

  def planner_params
    params.require(:planner).permit(:id, :procedure_id, :procedure_ids, :allotted_time)
  end


end
