module CheckoutHelper
  def total_price_with_shipping
    delivery_price = @order.delivery ? @order.delivery.price : 0
    number_to_currency(summary_cart_price + delivery_price, unit: '€')
  end
end
