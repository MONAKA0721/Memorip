class AnonymousUserPlan < ApplicationRecord
  has_many :destinations, as: :placeable
end
