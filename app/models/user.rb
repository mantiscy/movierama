class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :movies, :movie_ids, :rated_movies
  # attr_accessible :title, :body

  before_create :set_default_role

  has_many :movies
  has_many :rating_movies
  has_many :rated_movies, through: :rating_movies, source: :movie

  validates :name, presence: true

  private
    def set_default_role
        self.role ||= :user
    end
end
