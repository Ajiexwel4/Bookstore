class CatalogController < ApplicationController
  include SortingFromParams
  
  before_action :set_cart

  def index
    @categories = Category.all
    @books = sorting_from_params('Book', Book::SORTING).page params[:page]
  end
end
