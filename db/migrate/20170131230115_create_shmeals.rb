class CreateShmeals < ActiveRecord::Migration[5.0]
  def change
    create_table :shmeals do |t|
      t.datetime :shmealDayDate
      t.integer :menuItemID

      t.timestamps
    end
  end
end
