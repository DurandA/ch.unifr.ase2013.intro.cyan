class Car < ActiveRecord::Base
  belongs_to :user
  has_many :bids
  validates :auction_ending, presence: true
  validate :auction_ending_is_valid_date

  def auction_ending_is_valid_date
    errors.add(:auction_ending, 'must be a valid datetime'<< auction_ending) if ((Date.parse(auction_ending) rescue ArgumentError) == ArgumentError)
  end

  def auction_ending_is_datetime
    if !auction_ending.is_a?(DateTime)
      errors.add(:auction_ending, 'must be a valid datetime')
    end
  end

end