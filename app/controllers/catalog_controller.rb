class CatalogController < ApplicationController
  include SortingFromParams

  def index
    @categories = Category.all
    @books = sorting_from_params('Book', Book::SORTING).page params[:page]
  end
end
