class CreateShmconversations < ActiveRecord::Migration[5.0]
  def change
    create_table :shmconversations do |t|
      t.string :convChannel
      t.integer :originalCookID
      t.integer :originalEaterID
      t.datetime :convStartDate

      t.timestamps
    end
  end
end
