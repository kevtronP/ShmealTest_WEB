class MenuitemSerializer < ActiveModel::Serializer
  attributes :id, :mealAllergen1, :mealBlurb, :mealLastDate, :mealName, :mealQuantity, :mealScore, :mealThumbnail, :mealTotalQuantity, :lastShmeal, :photo, :user, :mealPhotoURL
end
