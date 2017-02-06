class CreateShmcookstatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :shmcookstatuses do |t|
      t.string :statusCode
      t.integer :cookID
      t.datetime :statusStartDate

      t.timestamps
    end
  end
end
