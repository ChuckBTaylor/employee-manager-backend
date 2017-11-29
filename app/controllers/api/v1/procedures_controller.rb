class Api::V1::ProceduresController < ApplicationController

  def index
    render json: Company.find(params[:company_id]).procedures
  end

  def update
    procedure_info = params[:procedure]
    procedure = Procedure.find(procedure_info[:id])
    if procedure.update(service_id: procedure_info[:service_id], piece_id: procedure_info[:piece_id], estimated_time: procedure_info[:estimated_time], complete: procedure_info[:complete])
      render json: procedure
    else
      render json: {errors: procedure.errors.full_messages}, status: 422
    end
  end

end
