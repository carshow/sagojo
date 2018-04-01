class Article < ApplicationRecord
  belongs_to :company
  has_many :categories, through: :articles_categories
  has_many :users, through: :users
  has_many :application

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
  validates :company_name, presence: true
  validates :end_of_date, presence: true
  validates :extra_comment, presence: true
end
