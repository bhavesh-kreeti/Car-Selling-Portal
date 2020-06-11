class AddPurchaseStatusToSeller < ActiveRecord::Migration[6.0]
  def change
  	    add_column :sellers, :purchase_status, :string , default: "purchase"
  end
end
