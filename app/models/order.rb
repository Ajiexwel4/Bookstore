class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :user
  has_one :billing_address, dependent: :destroy
  has_one :shipping_address, dependent: :destroy
  has_one :delivery
  has_one :credit_card

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def order_number(order)
    order.number = 'R' + order.id
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
