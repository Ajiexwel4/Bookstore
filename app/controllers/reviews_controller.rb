class ReviewsController < ApplicationController
  authorize_resource

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.create(review_params)
    redirect_to book_path(@book), notice: 'Thanks for Review. It will be published as soon as Admin will approve it.'
  end

  private
    def review_params
      params.require(:review).permit(:title, :comment, :grade, :status, :book_id).merge(user_id: current_user.id)
    end
end
