class HomeController < ApplicationController
  before_action :authenticate_admin_user, except: [:index]
  def index
    @latest_books = BookDecorator.decorate_collection(Book.last(3))

    # need to correct
    @bestsellers = BookDecorator.decorate_collection(Book.first(4))
  end
end
