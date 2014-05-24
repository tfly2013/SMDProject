class Comment < ActiveRecord::Base
  belongs_to :member
  belongs_to :event
  validates :content, presence: true, length: {minimum: 3, maximum: 1000}
end
