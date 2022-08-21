class Driver < ApplicationRecord
  belongs_to :user
  has_many :card_details
  has_many :orders
  has_many :wallet_histories
  validates :licence_d, :address, presence: true
  validates_format_of :name, with: /\A[^0-9`!@#$%\^&*+_=]+\z/
end
