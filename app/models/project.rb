class Project < ApplicationRecord
  belongs_to :client
  has_many :pieces, dependent: :destroy

  def total_est
    self.pieces.map(&:total_est).inject(0, &:+)
  end

  def total_worked
    self.pieces.map(&:total_worked).inject(0, &:+)
  end

  def procedure_ids
    self.pieces.map(&:procedures).flatten.map(&:id)
  end

end
