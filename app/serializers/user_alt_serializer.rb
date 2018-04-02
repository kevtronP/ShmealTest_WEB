class UserAltSerializer < UserSerializer
  has_many :menuitems
  has_many :shmmenuitemstatuses, through: :menuitems
  has_many :shmuserattributes
  has_many :shmuserstatuses
  has_many :shmcooks
  has_many :shmcustomerpmtmethods
end
