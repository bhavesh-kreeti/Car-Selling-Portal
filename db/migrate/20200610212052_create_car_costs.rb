class CreateCarCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :car_costs do |t|
      t.string :condition, null:  false, index: true
      t.string :price, null:  false , index: true
      t.timestamps
    end
  end
end
