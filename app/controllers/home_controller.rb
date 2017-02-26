class HomeController < ApplicationController
  include SortingFromParams

  def index
    @books = mobile_dev_books || sorting_from_params
    @latest_books = BookDecorator.decorate_collection(@books.latest_books)
    @bestsellers = BookDecorator.decorate_collection(@books.bestsellers)
  end

  private
    def mobile_dev_books
      Category.where(name: 'Mobile development').first.books if !params[:category_id]
    end
end
