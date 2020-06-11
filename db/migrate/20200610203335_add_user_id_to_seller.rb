class AddUserIdToSeller < ActiveRecord::Migration[6.0]
  def change
    add_reference :sellers, :user, foreign_key: true
  end
end
