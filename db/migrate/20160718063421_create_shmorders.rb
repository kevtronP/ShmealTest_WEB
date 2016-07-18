class CreateShmorders < ActiveRecord::Migration[5.0]
  def change
    create_table :shmorders do |t|
      t.datetime :orderActualTime
      t.boolean :orderApproved
      t.datetime :orderDay
      t.boolean :orderPickedUp
      t.float :orderPrice
      t.integer :orderQuantity
      t.float :orderScore
      t.datetime :orderTime
      t.integer :conversation
      t.integer :shmeal
      t.integer :eater
      t.integer :cook

      t.timestamps
    end
  end
end
