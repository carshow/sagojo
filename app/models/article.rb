class Article < ApplicationRecord
  belongs_to :company
  has_many :categories, through: :articles_categories
  has_many :users, through: :users
  has_many :application
end
