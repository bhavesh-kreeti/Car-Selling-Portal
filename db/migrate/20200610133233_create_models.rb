class CreateModels < ActiveRecord::Migration[6.0]
  def change
    create_table :models do |t|
      t.string :name, index: true,null: false

      t.timestamps
    end
  end
end
