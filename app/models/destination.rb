class Destination < ApplicationRecord
  belongs_to :placeable, polymorphic: true, inverse_of: :placeable
  # validates :plan_id, presence: true
  validate  :picture_size
  mount_uploader :picture, PictureUploader

  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
