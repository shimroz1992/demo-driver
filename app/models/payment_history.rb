class PaymentHistory < ApplicationRecord
  belongs_to :paymentable, polymorphic: true
  belongs_to :user
  validates :amount, :payment_type, presence: true
  scope :non_settled_payments, -> { where payment_type: 'paylater', is_settle: false }
end
