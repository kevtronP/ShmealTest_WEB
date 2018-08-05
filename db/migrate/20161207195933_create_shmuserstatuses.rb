class CreateShmuserstatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :shmuserstatuses do |t|
      t.string :statusCode
      t.integer :sendingUserID
      t.integer :receivingUserID
      t.datetime :statusStartDate

      t.timestamps
    end
  end
end
