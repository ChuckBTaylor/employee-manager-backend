class AddColumnsToPlannersProcedures < ActiveRecord::Migration[5.1]
  def change
    add_column :planners_procedures, :piece_id, :integer
    add_column :planners_procedures, :project_id, :integer
  end
end
