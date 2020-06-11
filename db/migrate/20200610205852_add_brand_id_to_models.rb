class AddBrandIdToModels < ActiveRecord::Migration[6.0]
  def change
    add_reference :models, :brand, foreign_key: true
  end
end
