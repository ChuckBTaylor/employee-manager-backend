class AddNameToOperations < ActiveRecord::Migration[5.1]
  def change
    add_column :operations, :name, :string, default: ""
  end
end
