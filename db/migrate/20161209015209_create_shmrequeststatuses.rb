class CreateShmrequeststatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :shmrequeststatuses do |t|
      t.string :statusCode
      t.integer :requestID
      t.datetime :statusStartDate

      t.timestamps
    end
  end
end
