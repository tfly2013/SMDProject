class Ticket < ActiveRecord::Base
  belongs_to :event
  validates :total, presence: true, inclusion: { in: 1..500 }
  validates :price, presence: true
end
