class CreateShmfundings < ActiveRecord::Migration[5.0]
  def change
    create_table :shmfundings do |t|
      t.integer :userID
      t.string :merchantID
      t.string :fundingType
      t.string :email
      t.string :phoneNumber
      t.string :accountNumber
      t.string :routingNumber
      t.datetime :fundingDate

      t.timestamps
    end
  end
end
