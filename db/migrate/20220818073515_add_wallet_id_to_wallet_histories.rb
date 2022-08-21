class AddWalletIdToWalletHistories < ActiveRecord::Migration[7.0]
  def change
    add_column :wallet_histories, :wallet_id, :integer
    add_index :wallet_histories, :wallet_id
  end
end
