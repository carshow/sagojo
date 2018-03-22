class Application < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  belongs_to :article
end
