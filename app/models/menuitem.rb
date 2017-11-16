class Menuitem < ApplicationRecord
  belongs_to :user
  has_many :shmshmealattributes
  has_many :shmeals
  has_many :shmmenuitemstatuses
end
