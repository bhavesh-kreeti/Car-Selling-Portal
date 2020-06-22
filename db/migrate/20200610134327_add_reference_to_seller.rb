class AddReferenceToSeller < ActiveRecord::Migration[6.0]
  def change
    add_reference :sellers, :city, foreign_key: true,null: false,unique: true
      add_reference :sellers, :model, foreign_key: true,null: false,unique: true
      add_reference :sellers, :registration_year, foreign_key: true,null: false,unique: true
      add_reference :sellers, :kilometer_driven, foreign_key: true,null: false,unique: true
      add_reference :sellers, :variant, foreign_key: true,null: false,unique: true
      add_reference :sellers, :brand, foreign_key: true,null: false,unique: true
  end
end
