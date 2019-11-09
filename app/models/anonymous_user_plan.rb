class AnonymousUserPlan < ApplicationRecord
  has_many :destinations, as: :placeable
  default_scope -> { order(created_at: :desc) }
end
