class CatalogController < ApplicationController
  include SortingFromParams
  SORTING = ['newest', 'popular', 'cheaper', 'expensive'].freeze

  def index
    @categories = Category.all
    @books = sorting_from_params(SORTING)
  end
end
