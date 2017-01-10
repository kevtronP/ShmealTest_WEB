class CreateMerchantwebhooks < ActiveRecord::Migration[5.0]
  def change
    create_table :merchantwebhooks do |t|
      t.string :kind
      t.string :notificationTime

      t.timestamps
    end
  end
end
