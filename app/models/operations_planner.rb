class OperationsPlanner < ApplicationRecord
  belongs_to :planner
  belongs_to :operation

  validates_uniqueness_of :operation_id, scope: :planner_id
end
