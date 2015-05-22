class RatingMovie < ActiveRecord::Base
  attr_accessible :hate, :like

  belongs_to :movie
  belongs_to :user

end
