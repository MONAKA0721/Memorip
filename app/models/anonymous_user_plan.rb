class AnonymousUserPlan < ApplicationRecord
  has_many :destinations, as: :placeable, dependent: :destroy, inverse_of: :placeable
  accepts_nested_attributes_for :destinations, allow_destroy: true
  validates :title, presence: true
  validate  :picture_size
  mount_uploader :picture, PictureUploader
  default_scope -> { order(created_at: :desc) }

  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
