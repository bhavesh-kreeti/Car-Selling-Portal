class AddReferenceToTokens < ActiveRecord::Migration[6.0]
  def change
    add_reference :tokens, :car_cost, foreign_key: true
  end
end
