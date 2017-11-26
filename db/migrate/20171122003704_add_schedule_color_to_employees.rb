class AddScheduleColorToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :schedule_color, :string, default: "#00AA00"
  end
end
