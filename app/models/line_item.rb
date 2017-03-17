class LineItem < ApplicationRecord
  belongs_to :book
  belongs_to :cart
  belongs_to :order

  default_scope { order(:id) }

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def total_price
    book.price * quantity
  end
end
