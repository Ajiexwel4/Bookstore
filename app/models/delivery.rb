class Delivery < ApplicationRecord
  belongs_to :order

  validates :title, :days, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
end
