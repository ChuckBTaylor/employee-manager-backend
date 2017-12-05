class Procedure < ApplicationRecord
  belongs_to :service, optional: true
  belongs_to :piece
  has_many :operations, dependent: :destroy
  before_create :set_estimated_time

  def set_estimated_time
    if self.service_id
      self.estimated_time = Service.find(self.service_id).default_time
    else
      self.estimated_time = 2.00
    end
  end

end
