class CreateShmrequestattributes < ActiveRecord::Migration[5.0]
  def change
    create_table :shmrequestattributes do |t|
      t.string :attributeName
      t.string :requestAttribute
      t.datetime :attributeDate
      t.integer :requestID

      t.timestamps
    end
  end
end
