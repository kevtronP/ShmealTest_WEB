class CreateShmcooks < ActiveRecord::Migration[5.0]
  def change
    create_table :shmcooks do |t|
      t.string :taxpayerID
      t.integer :userID

      t.timestamps
    end
  end
end
