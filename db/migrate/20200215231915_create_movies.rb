class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :movie_title
      t.string :genre
      t.integer :year
      t.string :image_url

      t.timestamps
    end
  end
end
