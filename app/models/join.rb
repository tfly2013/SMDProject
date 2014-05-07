class Join < ActiveRecord::Base
  belongs_to :member
  belongs_to :society
end
