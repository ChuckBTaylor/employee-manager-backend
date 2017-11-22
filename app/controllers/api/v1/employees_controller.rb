class Api::V1::EmployeesController < ApplicationController

  def index
    @employees = Company.find(params[:company_id]).employees
    render json: @employees
  end

  def create
    employee_info = params["employee"]
    @employee = Employee.new(name: employee_info["name"], schedule_color: employee_info["schedule_color"], is_admin: employee_info["is_admin"])
    if @employee.save
      Company.find(params[:company_id]).employees << @employee
      render json: @employee
    else
      render json: {errors: @employee.errors.full_messages}, status: 422
    end
  end


end
