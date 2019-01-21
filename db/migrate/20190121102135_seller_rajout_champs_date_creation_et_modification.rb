class SellerRajoutChampsDateCreationEtModification < ActiveRecord::Migration
  def change
    add_column :sellers, :created_at, :datetime
    add_column :sellers, :updated_at, :datetime
  end
end
