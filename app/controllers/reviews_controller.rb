class ReviewsController < InheritedResources::Base

  private

    def review_params
      params.require(:review).permit(:book_id, :user_id, :status, :state)
    end
end

