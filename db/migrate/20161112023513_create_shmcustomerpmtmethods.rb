class CreateShmcustomerpmtmethods < ActiveRecord::Migration[5.0]
  def change
    create_table :shmcustomerpmtmethods do |t|
      t.string :customerIDString
      t.string :firstName
      t.string :lastName
      t.string :paymentMethodToken
      t.string :nonce
      t.integer :userID

      t.timestamps
    end
  end
end
