class LineItem < ApplicationRecord
  belongs_to :book
  belongs_to :cart

  default_scope { order(:id) }

  def total_price
    book.price * quantity
  end
end
