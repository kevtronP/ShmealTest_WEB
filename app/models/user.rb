class User < ApplicationRecord
  has_many :menuitems
  has_many :shmmenuitemstatuses, through: :menuitems
  has_many :shmeals, through: :menuitems
  has_many :shmshmealattributes, through: :menuitems
  has_many :shmaddresses
  has_many :shmconversations
  has_many :shmcooks
  has_many :shmcookstatuses, through: :shmcooks
  has_many :shmcustomerpmtmethods
  has_many :shmfundings
  has_many :shmorders
  has_many :shmuserattributes
  has_many :shmuserstatuses
end
