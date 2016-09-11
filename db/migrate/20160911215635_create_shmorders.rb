class CreateShmorders < ActiveRecord::Migration[5.0]
  def change
    create_table :shmorders do |t|
      t.datetime :orderActualTime
      t.boolean :orderApproved
      t.datetime :orderDay
      t.datetime :orderPickupTime
      t.boolean :orderPickedUp
      t.float :orderPrice
      t.integer :orderQuantity
      t.float :orderScore
      t.boolean :orderReviewIgnored
      t.datetime :orderTime
      t.integer :conversationID
      t.integer :shmealID
      t.integer :eaterID
      t.integer :cookID

      t.timestamps
    end
  end
end
