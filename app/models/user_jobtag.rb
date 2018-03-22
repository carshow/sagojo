class UserJobtag < ApplicationRecord
  belongs_to :user
  belongs_to :job_tag
end
