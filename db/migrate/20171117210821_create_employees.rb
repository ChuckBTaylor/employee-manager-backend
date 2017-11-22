class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.boolean :is_admin, default: false
      t.belongs_to :company, foreign_key: true, optional: true

      t.timestamps
    end
  end
end
