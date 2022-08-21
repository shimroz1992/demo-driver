class Order < ApplicationRecord
  belongs_to :driver
  has_many :payment_histories, as: :paymentable
  enum payment_type: %i[card_type paylater not_set]
  # enum payment_status: [:published, :unpublished, :not_set]
  validates :amount, :description, :payment_type, presence: true
end
