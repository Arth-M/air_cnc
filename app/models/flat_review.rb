class FlatReview < ApplicationRecord
  belongs_to :booking
  AUTHORIZED_RATINGS = (1..5)

  validates :rating, inclusion: { in: AUTHORIZED_RATINGS }

end
