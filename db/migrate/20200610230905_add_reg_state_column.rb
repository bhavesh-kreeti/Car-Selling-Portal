class AddRegStateColumn < ActiveRecord::Migration[6.0]
  def change
  	add_column :registration_states, :name, :string, null:  false 
  end
end
