class User < ApplicationRecord
  has_many :user_reviews
  has_many :flats
  has_many :bookings
end
