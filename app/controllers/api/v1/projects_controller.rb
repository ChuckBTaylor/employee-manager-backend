class Api::V1::ProjectsController < ApplicationController

  def index
    projects = Client.find(params['client_id']).projects
    render json: projects
  end

  def show
    render json: Project.find(params[:id])
  end

end
