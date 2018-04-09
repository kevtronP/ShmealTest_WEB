class Menuitem < ApplicationRecord
  has_many :shmshmealattributes
  has_many :shmeals
  has_many :shmmenuitemstatuses
  belongs_to :user
  has_many :shmuserattributes, through: :user
end
