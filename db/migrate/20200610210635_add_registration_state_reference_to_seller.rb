class AddRegistrationStateReferenceToSeller < ActiveRecord::Migration[6.0]
  def change
    add_reference :sellers, :registration_state, foreign_key: true
  end
end
