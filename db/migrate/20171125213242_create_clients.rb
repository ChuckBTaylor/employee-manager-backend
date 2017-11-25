class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.belongs_to :company, foreign_key: true
    end
  end
end
