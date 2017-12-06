class Api::V1::ProjectsController < ApplicationController

  def index
    render json: Company.find(params[:company_id]).projects
  end

  def show
    project = Project.find(params[:id])
    render json: {project: project, total_est: project.total_est, total_worked: project.total_worked}
  end

  def create
    project_info = params[:project]
    project = Project.new(name: project_info[:name])
    if Client.find(project_info[:client_id]).projects << project
      render json: project
    else
      render json: {errors: project.errors.full_messages}, status: 422
    end
  end

  def update
    project_info = params[:project]
    project = Project.find(project_info[:id])
    if project.update(name: project_info[:name])
      render json: project
    else
      render json: {errors: project.errors.full_messages}, status: 422
    end
  end

  def destroy
    Project.destroy(params[:project][:id])
    render json: Project.all
  end

end
