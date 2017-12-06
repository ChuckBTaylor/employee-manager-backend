class CreatePlannersProcedures < ActiveRecord::Migration[5.1]
  def change
    create_table :planners_procedures do |t|
      t.belongs_to :planner, foreign_key: true
      t.belongs_to :procedure, foreign_key: true
      t.float :allotted_time

      t.timestamps
    end
  end
end
