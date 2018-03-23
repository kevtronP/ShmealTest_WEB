class ShmealAltSerializer < ActiveModel::Serializer
  attributes :id, :shmealDayDate, :menuItemID
  has_many :shmshmealstatuses
  has_many :shmshmealattributes
  belongs_to :menuitem
end
