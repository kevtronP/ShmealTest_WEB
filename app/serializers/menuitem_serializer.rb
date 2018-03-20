class MenuitemSerializer < ActiveModel::Serializer
  attributes :id, :mealName, :userID, :menuItemDate
  has_many :shmeals
  has_many :shmmenuitemstatuses
  has_many :shmshmealattributes
end
