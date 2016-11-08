class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :userEmail
      t.string :userName
      t.string :userSurname
      t.string :userPhoneNumber
      t.string :userBlurb
      t.string :userInstructions
      t.float :homeAddressLat
      t.float :homeAddressLon
      t.string :profPicURL
      t.integer :lastMenuItemID
      t.integer :cookID

      t.timestamps
    end
  end
end
