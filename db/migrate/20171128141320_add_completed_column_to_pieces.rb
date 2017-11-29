class AddCompletedColumnToPieces < ActiveRecord::Migration[5.1]
  def change
    add_column :pieces, :complete, :boolean, default: false
  end
end
