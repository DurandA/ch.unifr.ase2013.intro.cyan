class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :title
      t.text :description
      t.integer :mileage
      t.string :color
      t.string :brand
      t.string :auction_ending
      t.integer :ask_price
      t.integer :user_id

      t.timestamps
    end
  end
end
