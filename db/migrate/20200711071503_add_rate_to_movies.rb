class AddRateToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :rate, :float
  end
end
