class CreateMerchantwebhooks < ActiveRecord::Migration[5.0]
  def change
    create_table :merchantwebhooks do |t|
      t.string :kind
      t.string :merchantID
      t.string :message
      t.string :errorMessages
      t.string :bt_signature
      t.string :bt_payload
      t.datetime :notificationTime

      t.timestamps
    end
  end
end
