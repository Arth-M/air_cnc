class Flat < ApplicationRecord
  belongs_to :user
  has_many  :bookings
  has_many :flat_reviews, through: :bookings, dependent: :destroy

  has_many_attached :photos

  include PgSearch::Model
  # multisearchable against: [:title, :synopsis]
  pg_search_scope :search,
  against: [ :name, :city, :zipcode, :description ],
  using: {
    tsearch: { prefix: true }
  }
end
