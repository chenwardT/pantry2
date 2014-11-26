module IngredientsHelper

  def time_left_in_days(ingredient)
    ((ingredient.purchase_date + ingredient.expiration_date.duration.days - Time.now) / 1.day).round(2)
  end

  def format_datetime(ts)
    ts.strftime("%m-%-d-%Y")
  end

  def format_datetime_precise(ts)
    ts.strftime("%m-%-d-%Y %I:%M %p")
  end
end
