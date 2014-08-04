class Feedback < ActiveRecord::Base
  belongs_to :cat

  RATING_VALUES = [0, 1, 2, 3, 4, 5]
  
  validates_presence_of :rating
  validates_numericality_of :rating, only_integer: true
  validates_inclusion_of :rating, in: RATING_VALUES, message: "Must be in #{RATING_VALUES}"

end
