class CreateShmuserattributes < ActiveRecord::Migration[5.0]
  def change
    create_table :shmuserattributes do |t|
      t.string :attributeName
      t.string :userAttribute
      t.datetime :attributeDate
      t.integer :userID

      t.timestamps
    end
  end
end
