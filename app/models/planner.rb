class Planner < ApplicationRecord
  belongs_to :company
  has_many :planners_projects
  has_many :projects, through: :planners_projects
  has_many :operations_planners
  has_many :operations, through: :operations_planners
  before_create :set_info

  def set_info
    self.friday = self.monday + 4.days
  end



end
