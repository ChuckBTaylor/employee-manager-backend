class Api::V1::ServicesController < ApplicationController

  def index
    services = Company.find(params[:company_id]).services
    render json: services
  end

  def create
    service_info = params['service']
    service = Service.new(name: service_info['name'])
    if Company.find(params['company_id']).services << service
      render json: service
    else
      render json: {errors: service.errors.full_messages}, status: 422
    end
  end

  def update
    service_info = params['service']
    service = Service.find(params['id'])
    if service.update(name: service_info['name'])
      render json: service
    else
      render json: {errors: service.errors.full_messages}, status: 422
    end
  end

  def destroy
    Service.destroy(params['service']['id'])
    render json: Service.all
  end


end
