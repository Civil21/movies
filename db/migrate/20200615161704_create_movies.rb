class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :year
      t.string :desc
      t.float :rat

      t.timestamps
    end
  end
end
