class Piece < ApplicationRecord
  belongs_to :project
  has_many :procedures, dependent: :destroy


  def get_service_ids
    self.procedures.map do |procedure|
      procedure.service_id
    end
  end

  def get_total_worked
    self.procedures.map(&:total_worked).inject(0, &:+)
  end


  def total_est
    self.procedures.map(&:estimated_time).reduce(0, &:+)
  end

  def update_total_worked
    self.update(total_worked: self.get_total_worked)
    self.project.update_total_worked
  end


end
