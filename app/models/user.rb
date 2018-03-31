class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable

  has_one :profile, dependent: :destroy
  has_many :applications
  has_many :job_tags, through: :user_jobtags
  has_many :articles, through: :clips

  validates :check_box, acceptance: true
end
