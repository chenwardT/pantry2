class FoodType < ActiveRecord::Base
  has_many :expiration_dates
end
