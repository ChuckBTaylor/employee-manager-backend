class AddAlottedTimeToPlanners < ActiveRecord::Migration[5.1]
  def change
    add_column :planners, :allotted_time, :float, default: 150
  end
end
