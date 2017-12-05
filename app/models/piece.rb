class Piece < ApplicationRecord
  belongs_to :project
  has_many :procedures, dependent: :destroy

  def get_service_ids
    self.procedures.map do |procedure|
      procedure.service_id
    end
  end


end
