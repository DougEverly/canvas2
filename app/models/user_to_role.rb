class UserToRole < ApplicationRecord
  belongs_to :user
  belongs_to :role
end
