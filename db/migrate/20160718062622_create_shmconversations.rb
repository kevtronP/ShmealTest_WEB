class CreateShmconversations < ActiveRecord::Migration[5.0]
  def change
    create_table :shmconversations do |t|
      t.string :convChannel
      t.string :convChannel2
      t.datetime :convCheckIn1
      t.datetime :convCheckIn2
      t.datetime :convLastDate
      t.string :convLastMessage
      t.string :convUser1
      t.string :convUser2

      t.timestamps
    end
  end
end
