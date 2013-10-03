class Bid < ActiveRecord::Base
  belongs_to :car
  belongs_to :user
  validates :amount, presence: true,
  numericality: {only_integer: true, positive: true}
  validate :bid_amount

  def bid_amount
    if Bid.exists? ['amount >= ? AND car_id = ?', amount, car_id]
      errors.add( :amount, 'cannot be lower or equal to the previous bid')
    end
  end
end
