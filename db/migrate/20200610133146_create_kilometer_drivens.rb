class CreateKilometerDrivens < ActiveRecord::Migration[6.0]
  def change
    create_table :kilometer_drivens do |t|
      t.string :name, index: true,null: false,unique: true
      t.timestamps
    end
  end
end
