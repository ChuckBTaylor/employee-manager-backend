class CreatePlanners < ActiveRecord::Migration[5.1]
  def change
    create_table :planners do |t|
      t.date :monday
      t.date :friday
      t.belongs_to :company, foreign_key: true

      t.timestamps
    end
  end
end
