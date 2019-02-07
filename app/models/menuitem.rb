class Menuitem < ApplicationRecord
  has_many :shmshmealattributes
  has_many :shmeals
  has_many :shmorders, through: :shmeals
  has_many :shmrequeststatuses, through: :shmorders
  has_many :shmrequestattributes, through: :shmorders
  has_many :shmorderfeedbacks, through: :shmorders
  has_many :shmmenuitemstatuses
  belongs_to :user
  has_many :shmuserattributes, through: :user
end
