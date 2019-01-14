class TableSellers < ActiveRecord::Migration
  def change
    create_table :sellers
    add_column :sellers, :room, :int
  
  end
end
