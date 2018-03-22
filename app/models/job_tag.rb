class JobTag < ApplicationRecord
  has_many :users, through: :user_jobtags
end
