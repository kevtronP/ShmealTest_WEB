class CreateShmcooks < ActiveRecord::Migration[5.0]
  def change
    create_table :shmcooks do |t|
      t.string :merchantID
      t.string :taxpayerID
      t.string :firstName
      t.string :surName
      t.string :birthDateString
      t.string :email
      t.string :phoneNumber
      t.string :streetAddress
      t.string :locality
      t.string :region
      t.string :postalCode
      t.string :fundingType
      t.string :accountNumber
      t.string :routingNumber
      t.integer :userID

      t.timestamps
    end
  end
end
