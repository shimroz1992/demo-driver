class CreateWalletHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :wallet_histories do |t|
      t.float :total_amount
      t.string :payment_histories_ids
      t.references :driver, :card_detail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
