class CreatePieces < ActiveRecord::Migration[5.1]
  def change
    create_table :pieces do |t|
      t.belongs_to :project, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
