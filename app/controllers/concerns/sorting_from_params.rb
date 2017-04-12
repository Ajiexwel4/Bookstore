module SortingFromParams
  extend ActiveSupport::Concern

  private

    def sorting_from_params(model_name, conditions=[])
      if params[:category_id]
        Category.find(params[:category_id]).books.by_title
      elsif conditions.include?(params[:sorting])
        model_name.capitalize.constantize.send(params[:sorting])
      else
        model_name.capitalize.constantize.all
      end
    end
end
