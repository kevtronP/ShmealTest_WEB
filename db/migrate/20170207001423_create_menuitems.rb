class CreateMenuitems < ActiveRecord::Migration[5.0]
  def change
    create_table :menuitems do |t|
      t.string :mealName
      t.integer :userID
      t.string :menuItemDate

      t.timestamps
    end
  end
end
