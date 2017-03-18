class DeliveryDecorator < Drape::Decorator
  delegate_all

  def shipping_price
    h.number_to_currency object.price, unit: '€'
  end
end