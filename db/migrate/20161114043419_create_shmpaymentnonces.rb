class CreateShmpaymentnonces < ActiveRecord::Migration[5.0]
  def change
    create_table :shmpaymentnonces do |t|
      t.string :paymentMethodToken
      t.string :paymentNonce

      t.timestamps
    end
  end
end
