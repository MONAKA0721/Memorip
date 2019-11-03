class Plan < ApplicationRecord
  has_many :destinations, dependent: :destroy
  accepts_nested_attributes_for :destinations, allow_destroy: true
  # , reject_if: :all_blank
  validates :title, presence: true
end
