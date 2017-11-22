class RemoveActualStartFromSchedules < ActiveRecord::Migration[5.1]
  def change
    remove_column :schedules, :actual_start, :datetime
    remove_column :schedules, :actual_end, :datetime
  end
end
