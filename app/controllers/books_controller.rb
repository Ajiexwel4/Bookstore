class BooksController < InheritedResources::Base
  load_and_authorize_resource

  private
    def book_params
      params.require(:book).permit(:title, :description, :price, :cover, :dimension,
                                   :material, :publication_at, :in_stock,
                                   author_ids: [], category_ids: [])
    end
end
