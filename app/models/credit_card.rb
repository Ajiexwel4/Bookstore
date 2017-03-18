class CreditCard < ApplicationRecord
  belongs_to :user
  belongs_to :order

  validates :number, :name, :period, :cvv, presence: true
  validates :number, length: { minimum: 10 }, format: { with: /\A[0-9]+\z/ }
  validates :name, length: { maximum: 50 }, format: { with: /\A[(a-zA-Z)|(\s)]+\z/ }
  validates :period, format: { with: /\A((0[1-9])|(1[0-2]))\/[0-9]{2}\z/ }
  validates :cvv, format: {with: /\A\d{3,4}\z/ }
end
