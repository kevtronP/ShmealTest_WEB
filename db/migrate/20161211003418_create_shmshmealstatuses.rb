class CreateShmshmealstatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :shmshmealstatuses do |t|
      t.string :statusCode
      t.integer :shmealID
      t.datetime :statusStartDate

      t.timestamps
    end
  end
end
