class Movie < ActiveRecord::Base
  attr_accessible :description, :title, :rating_users, :likes, :hates

  belongs_to :user
  has_many :rating_movies
  has_many :rating_users, through: :rating_movies, source: :user
end
