class Bid < ActiveRecord::Base
  belongs_to :car
  validates :amount, presence: true,
  numericality: {only_integer: true}
  validate :bid_amount

  def bid_amount
    if Bid.exists? ['amount >= ?', amount]
      errors.add( :amount, 'bids cannot be lower or equal to the previous one')
    end
  end
end
