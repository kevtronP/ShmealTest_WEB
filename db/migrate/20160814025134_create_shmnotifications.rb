class CreateShmnotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :shmnotifications do |t|
      t.integer :userID
      t.integer :otherUserID
      t.integer :menuItemID
      t.string :notificationMessage
      t.datetime :notificationDate
      t.datetime :unfollowTimeStamp

      t.timestamps
    end
  end
end
