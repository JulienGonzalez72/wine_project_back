class Wine < ApplicationRecord
  COLORS = %w[white red pink]

  validates :color, inclusion: { in: COLORS }
end
