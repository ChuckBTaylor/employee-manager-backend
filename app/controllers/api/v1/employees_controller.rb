class Api::V1::EmployeesController < ApplicationController

  def index
    @employees = Company.find(params[:company_id]).employees
    render json: @employees
  end


end
