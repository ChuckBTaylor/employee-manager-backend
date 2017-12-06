class Piece < ApplicationRecord
  belongs_to :project
  has_many :procedures, dependent: :destroy

  def get_service_ids
    self.procedures.map do |procedure|
      procedure.service_id
    end
  end


  def total_est
    self.procedures.map(&:estimated_time).reduce(0, &:+)
  end

  def total_worked
    self.procedures.map(&:total_worked).reduce(0, &:+)
  end


end
