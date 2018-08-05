class ShmealSerializer < ActiveModel::Serializer
  attributes :id, :shmealDayDate, :menuItemID
  #has_many :shmshmealstatuses
  #has_many :shmshmealattributes
end
