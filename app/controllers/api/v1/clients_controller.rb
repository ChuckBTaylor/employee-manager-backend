class Api::V1::ClientsController < ApplicationController

  def index
    clients = Company.find(params[:company_id]).clients
    render json: clients
  end

  def create
    client_info = params['client']
    client = Client.new(name: client_info['name'])
    if Company.find(params['company_id']).clients << client
      render json: client
    else
      render json: {errors: client.errors.full_messages}, status: 422
    end
  end

  def update
    client_info = params['client']
    client = Client.find(params['id'])
    if client.update(name: client_info['name'])
      render json: client
    else
      render json: {errors: client.errors.full_messages}, status: 422
    end
  end

  def destroy
    Client.destroy(params['client']['id'])
    render json: Client.all
  end

end
