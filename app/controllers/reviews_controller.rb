class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(restaurant_params)
    @review.save

    redirect_to restaurants_path
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
