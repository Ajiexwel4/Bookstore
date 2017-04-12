module CheckoutHelper
  def total_price_with_shipping
    delivery_price = @order.delivery ? @order.delivery.price : 0
    number_to_currency(@order.total + delivery_price, unit: '€')
  end
end
