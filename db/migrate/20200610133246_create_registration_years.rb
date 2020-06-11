class CreateRegistrationYears < ActiveRecord::Migration[6.0]
  def change
    create_table :registration_years do |t|
      t.string :name

      t.timestamps
    end
  end
end