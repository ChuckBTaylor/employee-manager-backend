class Api::V1::EmployeesController < ApplicationController

  before_action :set_employee, only: :destroy

  def index
    employees = Company.find(params[:company_id]).employees
    render json: employees
  end

  def create
    employee_info = params[:employee]
    byebug
    employee = Employee.new(name: employee_info[:name], schedule_color: employee_info[:schedule_color], is_admin: employee_info[:is_admin], password: employee_info[:password], password_confirmation: employee_info[:password_confirmation])
    if employee.save
      Company.find(params[:company_id]).employees << employee
      render json: employee
    else
      render json: {errors: employee.errors.full_messages}, status: 422
    end
  end

  def update
    employee_info = params['employee']
    employee = Employee.find(params['id'])
    if employee.update(name: employee_info['name'], schedule_color: employee_info['schedule_color'], is_admin: employee_info['is_admin'])
      render json: employee
    else
      render json: {errors: employee.errors.full_messages}, status: 422
    end
  end

  def destroy
    Employee.destroy(params['employee']['id'])
    render json: Employee.all
  end

  def jwt
    employee = current_employee
    render json: employee
  end



  private



  def set_employee
    employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :id, :password, :password_confirmation, :schedule_color, :is_admin)
  end



end
