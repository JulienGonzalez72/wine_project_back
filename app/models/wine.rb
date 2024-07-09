class Wine < ApplicationRecord
  COLORS = %w[white red pink]

  validates :color, inclusion: { in: COLORS }

  has_many :ratings

  def serialize
    {
      **self.attributes,
      average_rating: average_rating,
      nb_ratings: ratings.size
    }
  end

  def average_rating
    return 0 if ratings.blank?
    ratings.sum(&:value) / ratings.size
  end
end
