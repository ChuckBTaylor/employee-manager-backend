class Api::V1::EmployeesController < ApplicationController

  before_action :set_employee, only: :destroy

  def index
    employees = Company.find(params[:company_id]).employees
    render json: employees
  end

  def create
    employee_info = params["employee"]
    employee = Employee.new(name: employee_info["name"], schedule_color: employee_info["schedule_color"], is_admin: employee_info["is_admin"])
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

  def login # post user data, sends back jwt token and user info
    # @user = User.find_by(name: user_params['name'])
    employee = Employee.where('lower(name) = ?', employee_params[:name].downcase).first # we don't have params[:id] so we can't search by id or use the show action
    if !employee
      return render json: {errors: "No employee found", message: "Can't find an employee with the name #{employee_params[:name]}"}
    end
    if employee.authenticate(params[:password])
      render json: {
        user: employee,
        jwt_token: issue_token({user_id: employee.id, company_id: employee.company_id}),
        message: "Success"
      }
    else
      render json: {message: 'Password was incorrect', errors: employee.errors.full_messages}, status: 400
    end
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
    params.require(:employee).permit(:name, :id, :password, :password_confirmation)
  end


end
