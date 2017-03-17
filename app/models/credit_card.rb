class CreditCard < ApplicationRecord
  belongs_to :user
  belongs_to :order

  validates :number, :name, :period, :cvv, presence: true
  validates :number, length: { minimum: 10 }, format: { with: /^[0-9]+$/ }
  validates :name, length: { maximum: 50 }, format: { with: /^[(a-zA-Z)|(\s)]+$/ }
  validates :period, format: { with: /^((0[1-9])|(1[0-2]))\/[0-9]{2}$/ }
  validates :cvv, format: {with: /^\d{3,4}$/ }
end
