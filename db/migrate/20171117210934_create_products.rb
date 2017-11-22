class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :img_url
      t.belongs_to :company

      t.timestamps
    end
  end
end
