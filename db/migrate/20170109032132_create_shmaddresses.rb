class CreateShmaddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :shmaddresses do |t|
      t.string :firstName
      t.string :lastName
      t.string :streetAddress
      t.string :streetAddress2
      t.string :locality
      t.string :postalCode
      t.string :region
      t.datetime :addressDate
      t.integer :userID

      t.timestamps
    end
  end
end
