# frozen_string_literal: true

class Movie < ApplicationRecord
  has_one_attached :image
  has_many_attached :images

  has_many :movie_categories
  has_many :categories, -> { distinct }, through: :movie_categories

  has_many :movie_players
  has_many :players, -> { distinct }, through: :movie_players

  has_many :comments

  def sname
    name.downcase
  end
end
