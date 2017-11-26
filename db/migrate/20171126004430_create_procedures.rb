class CreateProcedures < ActiveRecord::Migration[5.1]
  def change
    create_table :procedures do |t|
      t.belongs_to :service, foreign_key: true
      t.belongs_to :piece, foreign_key: true
      t.float :expected_time
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
