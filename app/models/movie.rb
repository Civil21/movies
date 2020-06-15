# frozen_string_literal: true

class Movie < ApplicationRecord
  has_one_attached :image
  has_many_attached :images
end
