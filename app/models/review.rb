class Review < ApplicationRecord
  belongs_to :booking

  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5], message: "%{value} has to be a number between 0 to 5." }
end
