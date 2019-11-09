class Destination < ApplicationRecord
  belongs_to :placeable, polymorphic: true
  # validates :plan_id, presence: true
end
