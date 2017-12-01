class Api::V1::OperationsController < ApplicationController

  def index
    render json: Operation.all
  end

  def create
    operation_info = params[:operation]
    operation = Operation.new(employee_id: operation_info[:employee_id], procedure_id: operation_info[:procedure_id], hours: operation_info[:hours])
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

end