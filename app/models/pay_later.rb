class PayLater < ApplicationRecord
  belongs_to :driver
  has_many :payment_histories, as: :paymentable
end
