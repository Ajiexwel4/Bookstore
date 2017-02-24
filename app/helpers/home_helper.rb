module HomeHelper
  def button_class_if(book)
    book.in_stock.zero? ? 'btn btn disabled' : 'btn btn-primary'
  end
end
