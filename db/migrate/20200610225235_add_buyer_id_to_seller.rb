class AddBuyerIdToSeller < ActiveRecord::Migration[6.0]
  def change
  	    add_column :sellers, :buyer_id, :integer
  end
end
