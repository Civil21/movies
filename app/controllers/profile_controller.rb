# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_user!

  def show
    @movies = user.movies
  end

  private

  def user
    @user ||= current_user
  end
end
