class CreateFlatReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :flat_reviews do |t|
      t.text :comment
      t.integer :rating

      t.timestamps
    end
  end
end
