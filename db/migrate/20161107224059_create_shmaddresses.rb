class CreateShmaddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :shmaddresses do |t|
      t.string :streetAddress
      t.string :streetAddress2
      t.string :locality
      t.integer :postalCode
      t.string :region
      t.string :userID

      t.timestamps
    end
  end
end
