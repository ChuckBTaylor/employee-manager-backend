class Api::V1::ClientsController < ApplicationController

  def index
    clients = Company.find(params[:company_id]).clients
    render json: clients
  end

  def create
    puts "hi"
    client = Client.new(name: client_params[:name])
    if Company.find(params[:company_id]).clients << client
      render json: client
    else
      render json: {errors: client.errors.full_messages}, status: 422
    end
  end

  def show
    client = Client.find(params[:id])
    render json: client
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


  private


  def client_params
    params.require(:client).permit(:name, :company_id)
  end
end
