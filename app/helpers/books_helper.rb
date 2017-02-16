module BooksHelper
  def full_author_name(book)
    book.authors.collect{ |author| author.firstname + " " + author.lastname }.join(', ')
  end
end
