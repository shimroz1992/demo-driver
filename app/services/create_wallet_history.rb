class CreateWalletHistory
  def initialize(driver_id)
    @id = driver_id
  end

  def create_wallet_history
    driver = Driver.find_by(id: @id[:driver_id])
    card_detail = driver.card_details.default_only.first
    user = User.find_by(id: driver.user_id)
    payment_histories = user.payment_histories.non_settled_payments

    if payment_histories.present? && card_detail.present?
      payment_histories_ids = payment_histories.ids.join(',')
      total_amount = payment_histories.map(&:amount).sum
      wallet = Wallet.where(wallet_type: 1).update(total_amount:).first
      wallet = Wallet.create(total_amount:, wallet_type: 1) if wallet.blank?
      wallet_history = WalletHistory.where(driver_id: driver.id).update(total_amount:,
                                                                        payment_histories_ids:).first

      if wallet_history.blank?
        WalletHistory.create(total_amount:, payment_histories_ids:,
                             driver_id: driver.id, card_detail_id: card_detail.id, wallet_id: wallet.id)
      end
    end
  end
end
