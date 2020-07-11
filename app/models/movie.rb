# frozen_string_literal: true

class Movie < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  has_many_attached :images, dependent: :destroy

  has_many :movie_categories, dependent: :destroy
  has_many :categories, -> { distinct }, through: :movie_categories

  has_many :movie_players, dependent: :destroy
  has_many :players, -> { distinct }, through: :movie_players

  has_many :favorites, dependent: :destroy
  has_many :users, -> { distinct }, through: :favorites

  has_many :comments, dependent: :destroy

  has_many :reviews, dependent: :destroy

  def check_rate
    pp reviews.average(:rate)
    update(rate: reviews.average(:rate))
  end

  def sname
    name.downcase
  end
end
