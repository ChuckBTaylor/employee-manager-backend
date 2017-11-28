class Api::V1::ProjectsController < ApplicationController

  def index
    projects = Client.find(params['client_id']).projects
    render json: projects
  end

  def show
    render json: Project.find(params[:id])
  end

  def create
    project_info = params['project']
    project = Project.new(name: project_info['name'])
    if Client.find(params[:client_id]).projects << project
      render json: project
    else
      render json: {errors: project.errors.full_messages}, status: 422
    end
  end

  def update
    project_info = params['project']
    project = Project.find(project_info['id'])
    if project.update(name: project_info['name'])
      render json: project
    else
      render json: {errors: project.errors.full_messages}, status: 422
    end
  end

  def destroy
    Project.destroy(params['project']['id'])
    render json: Project.all
  end

end
