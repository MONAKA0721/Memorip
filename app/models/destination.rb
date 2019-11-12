class Destination < ApplicationRecord
  belongs_to :placeable, polymorphic: true, inverse_of: :placeable
  # validates :plan_id, presence: true
end
