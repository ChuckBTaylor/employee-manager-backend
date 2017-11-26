class Api::V1::CompaniesController < ApplicationController
  def index
    @companies = Company.all
    render json: @companies
  end

  def show
    @company = Company.find(params[:id])
    render json: @company
  end

  def master_schedule
    @company = Company.find(params['id'])
    render json: @company.get_master_schedule
  end

  def all_projects
    projects = Company.find(params[:id]).projects
    render json: projects
  end

end
