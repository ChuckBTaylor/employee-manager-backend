class Api::V1::CompaniesController < ApplicationController
  def index
    @companies = Company.all
    render json: @companies
  end

  def create
    company_info = params[:company]
    company = Company.new(name: company_info[:name])
  end

  def show
    @company = Company.find(params[:id])
    render json: @company
  end

  def update
    company_info = params['company']
    company = Compnay.find(params[:id])
    if company.update(name: company_info['name'])
      render json: company
    else
      render json: {errors: company.errors.full_messages}, status: 422
    end
  end

  def master_schedule
    render json: Company.find(params['id']).master_schedule
  end

  def all_projects
    render json: Company.find(params[:id]).projects
  end

  def all_pieces
    render json: Company.find(params[:id]).pieces
  end

  def all_procedures
    render json: Company.find(params[:id]).procedures
  end

end
