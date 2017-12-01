class PlannersProject < ApplicationRecord
  belongs_to :project
  belongs_to :planner

  validates_uniqueness_of :planner_id, scope: :project_id
end
