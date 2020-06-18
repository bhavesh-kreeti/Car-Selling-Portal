class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :roles, index: true,null: false
      t.timestamps
    end
  end
end
