class CreateModels < ActiveRecord::Migration[6.0]
  def change
    create_table :models do |t|
      t.string :name, index: true,null: false,unique: true
      t.timestamps
    end
  end
end
