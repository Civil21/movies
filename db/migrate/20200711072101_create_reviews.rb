# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :movie_id
      t.float :rate
      t.string :desc

      t.timestamps
    end
  end
end
