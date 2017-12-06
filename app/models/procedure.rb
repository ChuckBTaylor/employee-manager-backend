class Procedure < ApplicationRecord
  belongs_to :service
  belongs_to :piece
  has_many :pps, class_name: :PlannersProcedure, :dependent => :destroy
  has_many :planners, through: :pps
  before_create :set_estimated_time
  before_create :update_project_id

  def set_estimated_time
    self.estimated_time = Service.find(self.service_id).default_time
  end

  def operations
    self.pps.map(&:operations).flatten
  end

  def total_worked
    self.operations.map(&:hours).reduce(0, &:+)
  end

  def total_allotted
    self.pps.map(&:allotted_time).inject(0, &:+)
  end

  def project
    Project.find(self.project_id)
  end

  def update_project_id
    self.project_id = Piece.find(self.piece_id).project_id
  end

end
