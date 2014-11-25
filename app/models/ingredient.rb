class Ingredient < ActiveRecord::Base
  belongs_to :user
  belongs_to :expiration_date
  default_scope -> { order(created_at: :asc) }
  validates :user_id, presence: true
  validates :expiration_date_id, presence: true

  def expired?
    Time.now > (purchase_date + expiration_date.duration.days)
  end

  def expires_on
    purchase_date + expiration_date.duration.days
  end

  def time_until_expiration_in_words
    distance_of_time_in_words(purchase_date, Time.now - expiration_date.duration.days)
  end
end
