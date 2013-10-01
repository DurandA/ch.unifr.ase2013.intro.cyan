class Bid < ActiveRecord::Base
  belongs_to :car
  validates :amount, presence: true
end
