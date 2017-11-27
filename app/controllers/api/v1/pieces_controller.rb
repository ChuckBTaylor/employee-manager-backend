class Api::V1::PiecesController < ApplicationController

  def index
    pieces = Project.find(params['project_id']).pieces
    render json: pieces
  end

  def show
    render json: Piece.find(params[:id])
  end

end
