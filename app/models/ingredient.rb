class Ingredient < ActiveRecord::Base
  belongs_to :user
  belongs_to :expiration_date
  default_scope -> { order(created_at: :asc) }
  validates :user, presence: true
  validates :expiration_date, presence: true
  validates :name, presence: true
  validate :purchase_date_cannot_be_in_the_future

  def expired?
    self.in_freezer ? Time.now > (purchase_date + expiration_date.freezer_duration.seconds) :
        Time.now > (purchase_date + expiration_date.fridge_duration.seconds)
  end

  def expires_on
    self.in_freezer ? purchase_date + expiration_date.freezer_duration.seconds :
        purchase_date + expiration_date.fridge_duration.seconds
  end

  def expires_on_formatted
    self.expires_on.strftime("%b %d, %Y")
  end

  def time_until_expiration_in_words
    self.in_freezer ? distance_of_time_in_words(purchase_date, Time.now - expiration_date.freezer_duration.days) :
        distance_of_time_in_words(purchase_date, Time.now - expiration_date.fridge_duration.days)
  end

  protected

    def purchase_date_cannot_be_in_the_future
      if purchase_date > Time.now
        errors.add(:purchase_date, "can't be in the future")
      end
    end
end
