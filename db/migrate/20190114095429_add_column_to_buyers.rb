class AddColumnToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :room, :int
  end
end
