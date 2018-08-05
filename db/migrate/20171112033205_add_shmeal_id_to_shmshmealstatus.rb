class AddShmealIdToShmshmealstatus < ActiveRecord::Migration[5.0]
  def change
    add_column :shmshmealstatuses, :shmeal_id, :integer
  end
end
