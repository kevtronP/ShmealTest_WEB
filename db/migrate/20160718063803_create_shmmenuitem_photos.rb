class CreateShmmenuitemPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :shmmenuitem_photos do |t|
      t.binary :data
      t.integer :menuItem

      t.timestamps
    end
  end
end
