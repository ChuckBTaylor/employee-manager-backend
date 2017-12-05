class AddActiveToEverything < ActiveRecord::Migration[5.1]
  def change
     add_column :employees, :active, :boolean, default: true
     add_column :clients, :active, :boolean, default: true
     add_column :projects, :active, :boolean, default: true
  end
end
