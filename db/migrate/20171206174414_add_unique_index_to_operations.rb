class AddUniqueIndexToOperations < ActiveRecord::Migration[5.1]
  def change
    add_index :operations, [:planners_procedure_id, :employee_id], unique: true
  end
end
