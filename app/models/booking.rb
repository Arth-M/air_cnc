class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  belongs_to :flat_review, optional: true
end
