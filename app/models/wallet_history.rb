class WalletHistory < ApplicationRecord
  belongs_to :card_detail
  belongs_to :driver
  belongs_to :wallet
  validates :total_amount, :payment_histories_ids, presence: true
end
