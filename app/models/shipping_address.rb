class ShippingAddress < ApplicationRecord
  belongs_to :user
  belongs_to :order

  validates :zip, length: { maximum: 10 }
  validates :phone, length: { maximum: 15 }, format: { with: /^\+[0-9]+$/ }
  validates :firstname, :lastname, :city, length: { maximum: 50 }, format: { with: /^[a-zA-Z]+$/ }
  validates :address, length: { maximum: 50 }, format: { with: /^[a-zA-Z0-9\,\-\s]+$/ }
end
