class Like < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  validates :plan_id, presence: true
  validates :user_id, presence: true
end
