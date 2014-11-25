module IngredientsHelper

  def time_left_in_days ingredient
    ((ingredient.purchase_date + ingredient.expiration_date.duration.days - Time.now) / 1.day).round(2)
  end
end
