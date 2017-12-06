class Operation < ApplicationRecord
  belongs_to :employee
  belongs_to :pp, class_name: :PlannersProcedure, foreign_key: 'planners_procedure_id'
  before_create :set_operation_name

  def set_operation_name
    procedure = Procedure.find(PlannersProcedure.find(self.planners_procedure_id).procedure_id)
    service_name = Service.find(procedure.service_id).name
    self.name = "#{Employee.find(self.employee_id).name} - #{service_name}"
  end

  def planner
    self.pp.planner
  end

  def procedure
    self.pp.procedure
  end


end
