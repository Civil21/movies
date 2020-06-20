# frozen_string_literal: true

class Movie < ApplicationRecord
  has_one_attached :image
  has_many_attached :images

  has_many :movie_categories
  has_many :categories, through: :movie_categories

  has_many :comments
end
