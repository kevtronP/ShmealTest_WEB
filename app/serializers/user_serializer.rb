class UserSerializer < ActiveModel::Serializer
  attributes :id, :userEmail, :userPhoneNumber, :userName, :lastName, :userDate, :freeShmeals
  #has_many :menuitems
end
