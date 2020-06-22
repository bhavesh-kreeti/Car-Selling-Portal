class CreateTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :tokens do |t|
      t.string :phoneno, null:  false , index: true
      t.string :status, default: 'processing'
      t.timestamps
    end
  end
end
