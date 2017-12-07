class Api::V1::PiecesController < ApplicationController

  def index
    render json: Company.find(params[:company_id]).pieces
  end

  def show
    render json: Piece.find(params[:id])
  end

  def create
    piece_params = params[:piece]
    piece = Piece.new(name: piece_params[:name])
    project = Project.find(piece_params[:project_id])
    if project.pieces << piece
      procedures = piece_params[:service_ids].map do |service_id|
        Procedure.create(piece: piece, service_id: service_id)
      end
      render json: {piece: piece, procedures: procedures}
    else
      render json: {errors: piece.errors.full_messages}, status: 422
    end
  end

  def update
    piece = Piece.find(piece_params[:id])
    if piece.update(name: piece_params[:name])
      piece.procedures.each do |procedure|
        if !piece_params[:service_ids].include?(procedure.service_id)
          Procedure.destroy(procedure.id)
        end
      end

      this_pieces_service_ids = piece.get_service_ids

      procedures = piece_params[:service_ids].each_with_object([]) do |service_id, array|
        if !this_pieces_service_ids.include?(service_id)
          array.push(Procedure.create(piece: piece, service_id: service_id))
        end
      end

      render json: {piece: piece, procedures: procedures}
    else
      render json: {errors: piece.errors.full_messages}, status: 422
    end
  end

  def destroy
    Piece.destroy(params[:piece][:id])
    render json: Piece.all
  end


  private

  def piece_params
    params.require(:piece).permit(:id, :name, :complete, :project_id, :service_ids => [])
  end

end
