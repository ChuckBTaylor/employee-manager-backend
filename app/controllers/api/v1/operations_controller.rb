class Api::V1::OperationsController < ApplicationController

  def index
    render json: Operation.all
  end

  def create
    operation = Operation.new(employee_id: operation_params[:employee_id], planners_procedure_id: operation_params[:planners_procedure_id], hours: operation_params[:hours])
    if operation.save
      render json: operation
    else
      render json: {errors: operation.errors.full_messages}, status: 422
    end
  end

  def update
    operation_info = params[:operation]
    operation = Operation.find(operation_info[:id])
    if operation.update(hours: operation_info[:hours])
      render json: operation
    else
      render json: {errors: operation.errors.full_messages}, status: 422
    end
  end

  def get_week
    render json: Planner.find(params[:planner_id]).operations
  end

  private

  def operation_params
    params.require(:operation).permit(:employee_id, :planners_procedure_id, :hours)
  end

end
