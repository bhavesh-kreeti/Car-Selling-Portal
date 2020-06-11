class CreateRegistrationStates < ActiveRecord::Migration[6.0]
  def change
    create_table :registration_states do |t|

      t.timestamps
    end
  end
end
