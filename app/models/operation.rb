class Operation < ApplicationRecord
  belongs_to :employee
  belongs_to :procedure
  has_many :operations_planners
  has_many :planners, through: :operations_planners
  before_create :set_operation_name

  def set_operation_name
    procedure = Procedure.find(self.procedure_id)
    service_name = Service.find(procedure.service_id).name
    self.name = "#{Employee.find(self.employee_id).name} - #{service_name}"
  end


end
