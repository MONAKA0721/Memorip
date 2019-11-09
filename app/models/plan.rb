class Plan < ApplicationRecord
  belongs_to :user
  has_many :destinations, as: :placeable, dependent: :destroy
  accepts_nested_attributes_for :destinations, allow_destroy: true
  # , reject_if: :all_blank
  validates :title, presence: true
  validates :user_id, presence: true
  validate  :picture_size
  mount_uploader :picture, PictureUploader

  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
