class Procedure < ApplicationRecord
  belongs_to :service
  belongs_to :piece
  has_many :pps, class_name: :PlannersProcedure, :dependent => :destroy
  has_many :planners, through: :pps
  before_create :set_estimated_time
  before_create :set_project_id


  def project
    Project.find(self.project_id)
  end

  def total_allotted
    self.pps.map(&:allotted_time).inject(0, &:+)
  end

  def operations
    self.pps.map(&:operations).flatten
  end

  def get_total_worked
    self.pps.map(&:total_worked).inject(0, &:+)
  end


  def update_total_worked
    self.update(total_worked: self.get_total_worked)
    self.piece.update_total_worked
  end

  def set_estimated_time
    self.estimated_time = Service.find(self.service_id).default_time
  end

  def set_project_id
    self.project_id = Piece.find(self.piece_id).project_id
  end

  def for_json
    {
      piece_id: self.piece_id,
      complete: self.complete,
      estimated_time: self.estimated_time,
      id: self.id,
      total_worked: self.total_worked,
      service_id: self.service_id,
      project_id: self.project_id,
      piece_name: self.piece.name,
      service_name: self.service.name
    }
  end

end
