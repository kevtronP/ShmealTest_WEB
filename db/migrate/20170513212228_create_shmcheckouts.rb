class CreateShmcheckouts < ActiveRecord::Migration[5.0]
  def change
    create_table :shmcheckouts do |t|
      t.string :nonce
      t.float :amount
      t.float :feeAmount
      t.string :deviceData
      t.string :merchantID

      t.timestamps
    end
  end
end
