class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy
  has_many :applications
  has_many :job_tags, through: :user_jobtags
  has_many :articles, through: :clips
  has_many :clips, dependent: :destroy

  validates :check_box, acceptance: true
end
