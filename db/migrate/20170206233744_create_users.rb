class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :userEmail
      t.string :userPhoneNumber
      t.string :userName
      t.datetime :userDate

      t.timestamps
    end
  end
end
