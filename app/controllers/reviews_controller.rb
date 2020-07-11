# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    review = current_user.reviews.build(review_params)
    redirect_back(fallback_location: root_path) if review.save
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :movie_id, :rate, :desc)
  end
end
