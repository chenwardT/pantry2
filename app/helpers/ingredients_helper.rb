module IngredientsHelper

  # TZ conversion may be unnecessary here.
  def time_left_in_days(ingredient)
    ((ingredient.purchase_date.in_time_zone(current_user.timezone) +
        ingredient.expiration_date.duration.days - Time.now.in_time_zone(current_user.timezone)) /
        1.day).round(2)
  end

  def format_datetime(ts)
    ts.in_time_zone(current_user.timezone).strftime("%m-%-d-%Y")
  end

  def format_datetime_precise(ts)
    ts.in_time_zone(current_user.timezone).strftime("%m-%-d-%Y %I:%M %p")
  end
end
