class AddEmailConfirmationColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email_confirm, :boolean, :default => false, index: true
    add_column :users, :confirm_token, :string, index: true
  end
end
