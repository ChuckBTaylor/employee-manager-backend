class Procedure < ApplicationRecord
  belongs_to :service, optional: true
  belongs_to :piece
  before_save :set_estimated_time

  def set_estimated_time
    if self.service_id
      self.estimated_time = Service.find(self.service_id).default_time
    else
      self.estimated_time = 2.00
    end
  end

end
