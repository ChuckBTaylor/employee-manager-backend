class AddActualToProcedure < ActiveRecord::Migration[5.1]
  def change
    add_column :procedures, :total_worked, :float, default: 0.00
    add_column :projects, :total_worked, :float, default: 0.00
    add_column :pieces, :total_worked, :float, default: 0.00
  end
end
