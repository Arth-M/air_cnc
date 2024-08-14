class Flat < ApplicationRecord
  belongs_to :user
  has_many  :bookings
  has_many :flat_reviews, through: :bookings

  has_many_attached :photos
end
