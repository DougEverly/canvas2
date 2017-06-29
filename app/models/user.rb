class User < ApplicationRecord
  has_many :user_to_roles
  has_many :roles, through: :user_to_roles
  
  def to_xml(root: "user")
    {
      email: email,
      first: first,
      last: last,
      roles: user_to_roles.map{|utr| utr.role.name},
    }.to_xml(root: root)
  end
end
