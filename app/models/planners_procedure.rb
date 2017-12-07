class PlannersProcedure < ApplicationRecord
  belongs_to :planner
  belongs_to :procedure
  has_many :operations, dependent: :destroy
  before_create :set_allotted_time

  before_create :update_piece_id
  before_create :update_project_id
  after_save :inform_procedure

  validates_uniqueness_of :planner_id, scope: :procedure_id

  def update_project_id
    self.project_id = Piece.find(self.piece_id).project_id
  end

  def update_piece_id
    self.piece_id = self.procedure.piece_id
  end

  def set_allotted_time
    self.allotted_time = Procedure.find(self.procedure_id).estimated_time
  end

  def total_worked
    self.operations.map(&:hours).reduce(0, &:+)
  end

  private

  def inform_procedure
    self.procedure.pps.map(&:total_worked).inject(0, &:+)
  end

end
