class CreateShmnotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :shmnotifications do |t|
      t.datetime :notificationDate
      t.string :notificationMessage
      t.integer :menuItem
      t.integer :otherUser
      t.integer :user

      t.timestamps
    end
  end
end
