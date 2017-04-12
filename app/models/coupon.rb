class Coupon < ApplicationRecord  
  validates :code, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :discount, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
end
