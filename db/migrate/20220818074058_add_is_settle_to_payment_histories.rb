class AddIsSettleToPaymentHistories < ActiveRecord::Migration[7.0]
  def change
    add_column :payment_histories, :is_settle, :boolean, default: false
  end
end
