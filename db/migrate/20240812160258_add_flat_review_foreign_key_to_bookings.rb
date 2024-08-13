class AddFlatReviewForeignKeyToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :flat_reviews, :booking, foreign_key: true
  end
end
