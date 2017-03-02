module CartsHelper
  def count_line_items_in_cart
    @cart ? @cart.line_items.count : '0'
  end

  def discount
    if @coupon
      return 'used' if !@coupon.active
      number_to_currency(@coupon.discount, unit: '€')
    else
      'none'
    end
  end

  def total_price
    number_to_currency(@cart.total_price, unit: '€')
  end

  def total_price_for_order
    number_to_currency(@cart.total_price_with_discount(@coupon), unit: '€')
  end

  def total_price_for_line_items
    number_to_currency(item.total_price, unit: '€')
  end
end
