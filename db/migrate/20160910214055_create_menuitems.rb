class CreateMenuitems < ActiveRecord::Migration[5.0]
  def change
    create_table :menuitems do |t|
      t.string :mealName
      t.string :mealBlurb
      t.datetime :mealLastDate
      t.integer :mealQuantity
      t.float :mealScore
      t.binary :mealThumbnail
      t.integer :mealTotalQuantity
      t.string :mealAllergen1
      t.string :mealAllergen2
      t.string :mealAllergen3
      t.string :mealAllergen4
      t.string :mealAllergen5
      t.string :mealAllergen6
      t.integer :lastShmeal
      t.integer :photo
      t.integer :user
      t.string :mealPhotoURL

      t.timestamps
    end
  end
end
