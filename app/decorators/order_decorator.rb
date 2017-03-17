class OrderDecorator < Drape::Decorator
  delegate_all

  def customer_name_by_address_type(name)
    [object.send("#{name}_address").firstname, object.send("#{name}_address").lastname].join(' ')  
  end

  def address_by_type(name)
    object.send("#{name}_address").address
  end

  def city_by_address_type(name)
    object.send("#{name}_address").city
  end

  def country_by_address_type(name)
    Country.find(object.send("#{name}_address").country).name
  end

  def phone_by_address_type(name)
    'Phone ' + object.send("#{name}_address").phone
  end

  def delivery
    object.delivery.title
  end

  def delivery_days
    object.delivery.days
  end

  def card_number
    '**** **** **** ' + object.credit_card.number.to_s.last(4)
  end

  def period_of_cart
    mm, yy = object.credit_card.period.split('/')
    mm + '/' + '20' +yy    
  end

  def delivery_price
    h.number_to_currency object.delivery.price, unit: '€'
  end

end