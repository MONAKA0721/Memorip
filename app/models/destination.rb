class Destination < ApplicationRecord
  belongs_to :plan
  validates :plan_id, presence: true
  validates :name, presence: true
end
