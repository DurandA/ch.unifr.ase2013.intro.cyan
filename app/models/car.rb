class Car < ActiveRecord::Base
  has_many :bids, dependent: :destroy
  validates :title, presence: true,
            length: { minimum: 5 }
end
