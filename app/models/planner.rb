class Planner < ApplicationRecord
  belongs_to :company
  has_and_belongs_to_many :projects
  before_create :set_info

  def set_info
    self.friday = self.monday + 4.days
  end



end
