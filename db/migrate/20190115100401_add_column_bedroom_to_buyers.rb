class AddColumnBedroomToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :bedroom, :int
  end
end
