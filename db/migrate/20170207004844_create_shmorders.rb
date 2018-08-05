class CreateShmorders < ActiveRecord::Migration[5.0]
  def change
    create_table :shmorders do |t|
      t.datetime :orderDay
      t.datetime :orderTime
      t.integer :conversationID
      t.integer :shmealID
      t.integer :eaterID
      t.integer :cookID

      t.timestamps
    end
  end
end
