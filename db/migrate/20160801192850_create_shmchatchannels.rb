class CreateShmchatchannels < ActiveRecord::Migration[5.0]
  def change
    create_table :shmchatchannels do |t|
      t.string :chatChannel
      t.datetime :chatCheckIn1
      t.datetime :chatCheckIn2
      t.string :chatUser1
      t.string :chatUser2

      t.timestamps
    end
  end
end
