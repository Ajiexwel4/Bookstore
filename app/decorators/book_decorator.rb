class BookDecorator < Drape::Decorator
  delegate_all

  def image
    h.image_tag model.cover.thumb.url
  end

  def category
    object.categories.collect(&:name).join(', ')
  end

  def authors
    object.authors.collect{ |author| author.firstname + " " + author.lastname }.join(', ')
  end

  def description
    h.truncate object.description, length: 100
  end

  def price
    h.number_to_currency object.price, unit: '€'
  end
end
