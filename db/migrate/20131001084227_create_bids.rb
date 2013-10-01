class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :amount
      t.integer :user_id
      t.integer :car_id

      t.timestamps
    end
  end
end
