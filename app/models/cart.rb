class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :user

  def add_book(book)
    current_item = line_items.find_by(book: book)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(book: book)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def total_price_with_discount(coupon)
    if coupon && coupon.active
      coupon.update!(active: false)
      self.total_price-coupon.discount
    else
      self.total_price
    end
  end
end
