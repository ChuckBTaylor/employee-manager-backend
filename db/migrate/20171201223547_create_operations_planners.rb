class CreateOperationsPlanners < ActiveRecord::Migration[5.1]
  def change
    create_table :operations_planners do |t|
      t.belongs_to :planner, foreign_key: true
      t.belongs_to :operation, foreign_key: true

      t.timestamps
    end
  end
end
