class CreateShmcheckins < ActiveRecord::Migration[5.0]
  def change
    create_table :shmcheckins do |t|
      t.datetime :checkInTime
      t.integer :userID
      t.integer :conversationID

      t.timestamps
    end
  end
end
