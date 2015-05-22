class CreateRatingMovies < ActiveRecord::Migration
  def change
    create_table :rating_movies do |t|
      t.boolean :like
      t.boolean :hate
      t.belongs_to :user
      t.belongs_to :movie

      t.timestamps
    end
  end
end
