class Shmeal < ApplicationRecord
  has_many :shmshmealstatuses
  has_many :shmshmealattributes
  has_many :shmorders
  belongs_to :menuitem
  has_many :shmeals, through: :menuitem
end
