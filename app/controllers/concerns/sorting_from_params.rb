module SortingFromParams
  extend ActiveSupport::Concern

  private

    def sorting_from_params(conditions=[])
      if params[:category_id]
        Category.find(params[:category_id]).books
      elsif conditions.include?(params[:sorting])
        Book.send(params[:sorting])
      else
        Book.order(:title)
      end
    end
end
