class Api::V1::PlannersProceduresController < ApplicationController

  def create
    pp = PlannersProcedure.new(planner_id: ppp[:planner_id], procedure_id: ppp[:procedure_id])
    puts "hi"
    if pp.save
      render json: pp
    else
      render json: {errors: pp.errors.full_messages}, status: 422
    end
  end

  def update
    pp = PlannersProcedure.find(ppp[:id])
    if pp.update(allotted_time: ppp[:allotted_time])
      render json: pp
    else
      render json: {errors: pp.errors.full_messages}, status: 422
    end
  end

  def destroy
    PlannersProcedure.destroy(ppp[:id])
    render json: {message: "Deleted"}
  end



  private


  def planners_procedures_params
    params.require(:planners_procedure).permit(:id, :planner_id, :procedure_id, :allotted_time)
  end

  def ppp
    planners_procedures_params
  end


end
