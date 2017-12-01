class CreatePlannersProjectsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :planners_projects do |t|
      t.belongs_to :planner, foreign_key: true
      t.belongs_to :project, foreign_key: true
    end
  end
end
