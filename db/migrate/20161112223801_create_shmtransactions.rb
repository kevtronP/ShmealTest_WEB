class CreateShmtransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :shmtransactions do |t|
      t.string :payment_token
      t.string :client_token
      t.string :paymentType

      t.timestamps
    end
  end
end
