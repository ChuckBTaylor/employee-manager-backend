class CreateOperations < ActiveRecord::Migration[5.1]
  def change
    create_table :operations do |t|
      t.belongs_to :employee, foreign_key: true
      t.belongs_to :procedure, foreign_key: true
      t.float :hours

      t.timestamps
    end
  end
end
