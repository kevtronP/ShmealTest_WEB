class CreateShmpaymentmethodstatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :shmpaymentmethodstatuses do |t|
      t.string :statusCode
      t.integer :paymentMethodID
      t.datetime :statusStartDate

      t.timestamps
    end
  end
end
