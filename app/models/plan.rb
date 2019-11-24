class Plan < ApplicationRecord
  belongs_to :user
  has_many :destinations, as: :placeable, dependent: :destroy, inverse_of: :placeable
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  accepts_nested_attributes_for :destinations, allow_destroy: true
  # , reject_if: :all_blank
  validates :title, presence: true
  validates :user_id, presence: true
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
