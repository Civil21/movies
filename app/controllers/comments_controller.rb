# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.create(comment_params)
    comment.user = current_user
    if comment.save
      redirect_back(fallback_location: root_path)
    else
      # повідомити про це
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :movie_id)
  end
end
