class AddGrandparentToProcedure < ActiveRecord::Migration[5.1]
  def change
    add_column :procedures, :project_id, :integer
  end
end
