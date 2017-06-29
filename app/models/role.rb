class Role < ApplicationRecord
has_many :user_to_roles
has_many :users, through: :user_to_roles
end
