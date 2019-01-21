class AddColumnBedroomToSellerTabel < ActiveRecord::Migration
  def change
    add_column :sellers, :bedroom, :int
  end
end
