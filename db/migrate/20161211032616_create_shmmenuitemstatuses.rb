class CreateShmmenuitemstatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :shmmenuitemstatuses do |t|
      t.string :statusCode
      t.integer :menuItemID
      t.datetime :statusStartDate

      t.timestamps
    end
  end
end
