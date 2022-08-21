class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.float :amount
      t.text :description
      t.integer :payment_type
      t.integer :payment_status
      t.references :driver, null: false, foreign_key: true

      t.timestamps
    end
  end
end
