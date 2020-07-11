# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  after_save :check_movie

  def check_movie
    movie.check_rate
  end
end
