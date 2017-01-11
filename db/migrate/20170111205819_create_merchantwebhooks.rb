class CreateMerchantwebhooks < ActiveRecord::Migration[5.0]
  def change
    create_table :merchantwebhooks do |t|
      t.string :kind
      t.string :merchantID
      t.string :message
      t.string :errors
      t.datetime :notificationTime

      t.timestamps
    end
  end
end
