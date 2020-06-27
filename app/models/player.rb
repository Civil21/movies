# frozen_string_literal: true

class Player < ApplicationRecord
  has_many :movie_players
  has_many :movies, -> { distinct }, through: :movie_players

  has_one_attached :image

  def picture
    if image.attached?
      image
    else
      'player.png'
    end
  end
end
