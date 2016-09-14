class MenuitemSerializer < ActiveModel::Serializer
  attributes :id, :mealName, :mealBlurb, :mealLastDate, :mealQuantity, :mealScore, :mealScoreQuantity, :mealTotalQuantity, :mealAllergen1, :mealAllergen2, :mealAllergen3, :mealAllergen4, :mealAllergen5, :mealAllergen6, :userID, :mealPhotoURL
end
