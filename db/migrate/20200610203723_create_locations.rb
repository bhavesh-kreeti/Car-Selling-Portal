class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :address, null:  false , index: true
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
