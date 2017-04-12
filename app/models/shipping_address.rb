class ShippingAddress < ApplicationRecord
  belongs_to :user
  belongs_to :order

  validates :zip, length: { maximum: 10 }
  validates :phone, length: { maximum: 15 }, format: { with: /\A\+[0-9]+\z/ }
  validates :firstname, :lastname, :city, length: { maximum: 50 }, format: { with: /\A[a-zA-Z]+\z/ }
  validates :address, length: { maximum: 50 }, format: { with: /\A[a-zA-Z0-9\,\-\s]+\z/ }
end
