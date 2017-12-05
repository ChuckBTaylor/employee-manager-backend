class Planner < ApplicationRecord
  belongs_to :company
  has_many :planners_projects
  has_many :projects, through: :planners_projects
  has_many :operations
  before_create :set_info

  validates_uniqueness_of :monday, scope: :company_id

  def set_info
    self.friday = self.monday + 4.days
  end



end
