class CreateMenuitems < ActiveRecord::Migration[5.0]
  def change
    create_table :menuitems do |t|
      t.string :mealAllergen1
      t.string :mealBlurb
      t.datetime :mealLastDate
      t.string :mealName
      t.integer :mealQuantity
      t.float :mealScore
      t.binary :mealThumbnail
      t.integer :mealTotalQuantity
      t.integer :lastShmealID
      t.integer :photoID
      t.integer :userID
      t.string :mealPhotoURL

      t.timestamps
    end
  end
end
