class CreateMoviePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_players do |t|
      t.integer :movie_id
      t.integer :player_id

      t.timestamps
    end
  end
end
