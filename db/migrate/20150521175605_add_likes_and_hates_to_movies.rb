class AddLikesAndHatesToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :likes, :integer
    add_column :movies, :hates, :integer
  end
end
