class UserSerializer < ActiveModel::Serializer
  attributes :id, :userEmail, :userPhoneNumber, :userName, :lastName, :userDate, :freeShmeals
  #has_many :menuitems
  #has_many :shmuserattributes
  #has_many :shmuserstatuses
  #has_many :shmcooks
end
