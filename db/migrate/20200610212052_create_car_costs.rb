class CreateCarCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :car_costs do |t|
      t.string :condition, null:  false
      t.string :price, null:  false 
      t.timestamps
    end
  end
end
