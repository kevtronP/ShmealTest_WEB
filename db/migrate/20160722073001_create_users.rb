class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.float :homeAddressLat
      t.float :homeAddressLon
      t.string :userBlurb
      t.string :userEmail
      t.string :userInstructions
      t.string :userName
      t.string :userPhoneNumber
      t.string :userScore
      t.string :userThumbnail
      t.string :profPicURL
      t.integer :userTotalShmeals
      t.string :lastMenuItem_id

      t.timestamps
    end
  end
end
