class CreateFlats < ActiveRecord::Migration[7.1]
  def change
    create_table :flats do |t|
      t.string :name
      t.string :city
      t.string :zipcode
      t.string :street
      t.string :full_address
      t.string :description
      t.integer :price
      t.float :mean_rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
