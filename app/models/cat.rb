class Cat < ActiveRecord::Base
  has_many :feedback

  def as_json
    {
      "name" => name,
      "image" => image,
      "average_rating" => average_rating,
      "_self" => "#{ENV['ROOT_URL']}/cats/#{id}"
    }
  end

  def average_rating
    if feedback.average(:rating)
      feedback.average(:rating).round
    else
      "This cat has not been rated yet."
    end
  end
end
