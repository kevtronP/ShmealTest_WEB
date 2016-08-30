class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.string :deviceToken
      t.boolean :pushNotificationsOn
      t.datetime :deviceTokenBeginDate
      t.integer :userID

      t.timestamps
    end
  end
end
