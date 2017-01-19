class CreateShmshmealattributes < ActiveRecord::Migration[5.0]
  def change
    create_table :shmshmealattributes do |t|
      t.string :attributeName
      t.string :shmealAttribute
      t.datetime :shmealAtrbDate
      t.datetime :attributeDate
      t.integer :shmealID

      t.timestamps
    end
  end
end
