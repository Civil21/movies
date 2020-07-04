# frozen_string_literal: true

class AddIndexToMovies < ActiveRecord::Migration[6.0]
  def change
    add_index :movies, :year
    add_index :movies, :created_at
    add_index :movie_categories, %i[movie_id category_id], unique: true
  end
end
