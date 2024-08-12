class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.float :payment_amount
      t.references :flat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :flat_review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
