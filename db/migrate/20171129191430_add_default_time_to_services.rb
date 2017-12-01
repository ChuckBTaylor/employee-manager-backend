class AddDefaultTimeToServices < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :default_time, :float, default: 2.00
  end
end
