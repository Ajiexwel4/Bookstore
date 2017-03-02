module CartsHelper
  def count_line_items_in_cart
    @cart ? @cart.line_items.count : '0'
  end
end
