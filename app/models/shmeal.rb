class Shmeal < ApplicationRecord
  has_many :shmshmealstatuses
  has_many :shmshmealattributes
  has_many :shmeals
end
