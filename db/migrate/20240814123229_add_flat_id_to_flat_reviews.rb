class AddFlatIdToFlatReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :flat_reviews, :flat_id, :integer
  end
end
