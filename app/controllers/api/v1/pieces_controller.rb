class Api::V1::PiecesController < ApplicationController

  def index
    pieces = Project.find(params['project_id']).pieces
    render json: pieces
  end

  def show
    render json: Piece.find(params[:id])
  end

  def create
    piece_info = params['piece']
    piece = Piece.new(name: piece_info['name'])
    if Project.find(params[:project_id]).pieces << piece
      render json: piece
    else
      render json: {errors: piece.errors.full_messages}, status: 422
    end
  end

  def update
    piece_info = params['piece']
    piece = Piece.find(piece_info['id'])
    if piece.update(name: piece_info['name'])
      render json: piece
    else
      render json: {errors: piece.errors.full_messages}, status: 422
    end
  end

  def destroy
    Piece.destroy(params['piece']['id'])
    render json: Piece.all
  end

end
