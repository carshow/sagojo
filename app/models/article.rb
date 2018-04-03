class Article < ApplicationRecord
  belongs_to :company
  has_many :categories, through: :articles_categories
  has_many :users, through: :clips
  has_many :clips

  validates :text, presence: true
  validates :image, presence: true
  validates :comment, presence: true
  validates :price, presence: true
  validates :title, presence: true
  validates :overview, presence: true
  validates :qualification, presence: true
  validates :requested_number_of_people, presence: true
  validates :period, presence: true
  validates :destination, presence: true
  validates :end_of_date, presence: true
  mount_uploader :image, ImageUploader
  mount_uploader :image_of_person_in_charge, ImageUploader

  acts_as_taggable
  acts_as_taggable_on :categories

end
