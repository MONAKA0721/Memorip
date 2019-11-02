class Plan < ApplicationRecord
  has_many :destinations, dependent: :destroy
end
