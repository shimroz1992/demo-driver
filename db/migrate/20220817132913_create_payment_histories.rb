class CreatePaymentHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_histories do |t|
      t.float :amount
      t.integer :payment_on_id
      t.string :payment_type
      t.references :paymentable, polymorphic: true, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
