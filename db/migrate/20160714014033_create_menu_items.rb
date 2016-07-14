class CreateMenuItems < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_items do |t|
      t.string :mealAllergen1
      t.string :mealBlurb
      t.datetime :mealLastDate
      t.string :mealName
      t.integer :mealQuantity
      t.float :mealScore
      t.binary :mealThumbnail
      t.integer :mealTotalQuantity
      t.integer :lastShmeal_id
      t.integer :photo_id
      t.integer :user_id

      t.timestamps
    end
  end
end
