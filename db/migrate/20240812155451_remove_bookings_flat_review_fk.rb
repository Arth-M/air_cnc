class RemoveBookingsFlatReviewFk < ActiveRecord::Migration[7.1]
  def change
    remove_reference :bookings, :flat_review, foreign_key: true, index: false
  end
end
