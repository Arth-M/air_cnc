class FlatReview < ApplicationRecord
  belongs_to :booking
  belongs_to :flat
  AUTHORIZED_RATINGS = (1..5)
  validates :rating, inclusion: { in: AUTHORIZED_RATINGS }

end
