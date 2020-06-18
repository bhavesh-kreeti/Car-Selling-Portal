class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name, index: true,null: false

      t.timestamps
    end
  end
end
