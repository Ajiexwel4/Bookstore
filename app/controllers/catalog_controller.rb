class CatalogController < ApplicationController
  SORTING = ['newest', 'popular', 'cheaper', 'expensive'].freeze

  def index
    @categories = Category.all
    @books = if params[:category_id]
      Category.find(params[:category_id]).books
    elsif sorting_params?
      Book.send(params[:sorting])
    else
      Book.order(:title)
    end
  end

  private
    def sorting_params?
      SORTING.include?(params[:sorting])
    end
end
