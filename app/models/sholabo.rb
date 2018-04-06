class Sholabo < ApplicationRecord

  validates :title, presence: true
  validates :image, presence: true
  validates :text, presence: true
  validates :writer_image, presence: true
  validates :writer, presence: true
  validates :comment, presence: true

  mount_uploader :image, ImageUploader
  mount_uploader :writer_image, ImageUploader

  acts_as_taggable
end
