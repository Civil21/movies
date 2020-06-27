# frozen_string_literal: true

class MoviePlayer < ApplicationRecord
  belongs_to :movie
  belongs_to :player
end
