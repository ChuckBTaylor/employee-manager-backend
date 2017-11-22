class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.belongs_to :employee, foreign_key: true
      t.datetime :scheduled_start
      t.datetime :scheduled_end
      t.datetime :actual_start
      t.datetime :actual_end
      t.boolean :is_holiday, default: false
      t.float :break_took, default: 0.00


      t.timestamps
    end
  end
end
