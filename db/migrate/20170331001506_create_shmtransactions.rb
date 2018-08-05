class CreateShmtransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :shmtransactions do |t|
      t.string :client_token

      t.timestamps
    end
  end
end
