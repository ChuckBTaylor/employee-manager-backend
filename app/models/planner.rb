class Planner < ApplicationRecord
  belongs_to :company
  has_many :pps, class_name: :PlannersProcedure, dependent: :destroy
  has_many :procedures, through: :pps

  before_create :set_info

  validates_uniqueness_of :monday, scope: :company_id

  def set_info
    self.friday = self.monday + 4.days
  end

  def operations
    self.pps.map(&:operations).flatten
  end

  def project_ids
    self.procedures.map(&:project_id).uniq
  end

  def pps_by_procedure
    obj = {}
    self.pps.each do |pp |
      if obj[pp.procedure_id]
        obj[pp.procedure_id] << pp
      else
        obj[pp.procedure_id] = [pp]
      end
    end
    obj
  end

  def procedures_by_project
    obj = {}
    self.procedures.each do |procedure|
      if obj[procedure.project_id]
        obj[procedure.project_id] << procedure
      else
        obj[procedure.project_id] = [procedure]
      end
    end
    obj
  end

  def procedures_by_piece
    obj = {}
    self.procedures.each do |procedure|
      if obj[procedure.piece_id]
        obj[procedure.piece_id] << procedure
      else
        obj[procedure.piece_id] = [procedure]
      end
    end
    obj
  end


end
