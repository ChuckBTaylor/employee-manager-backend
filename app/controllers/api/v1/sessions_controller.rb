class Api::V1::SessionsController < ApplicationController

  def show
    render json: {
      id: current_employee.id,
      name: current_employee.name
    }
  end

  def create
    employee = Employee.find_by(name: params[:name])
    if employee && employee.authenticate(params[:password])
      payload = {
        employee_id: employee.id,
        company_id: employee.compnay_id
      }
      token = issue_token(payload)
      render json: {jwt: token, message: "You're logged in"}
    else
      render json: {message: "Fail"}
    end
  end

end
