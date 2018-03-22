class Profile < ApplicationRecord
  belongs_to :user
  has_many :travel_plans
  has_many :applications
end
