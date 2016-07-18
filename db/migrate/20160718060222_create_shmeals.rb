class CreateShmeals < ActiveRecord::Migration[5.0]
  def change
    create_table :shmeals do |t|
      t.float :shmealLat
      t.float :shmealLon
      t.datetime :shmealPostDate
      t.datetime :shmealDayDate
      t.datetime :shmealStartTime
      t.datetime :shmealEndTime
      t.integer :shmealQuantity
      t.float :shmealScore
      t.integer :menuItem_id

      t.timestamps
    end
  end
end
