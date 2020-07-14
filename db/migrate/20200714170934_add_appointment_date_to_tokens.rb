class AddAppointmentDateToTokens < ActiveRecord::Migration[6.0]
  def change
    add_column :tokens, :appointment_date, :datetime
  end
end
