class Ingredient < ActiveRecord::Base
  belongs_to :user
  belongs_to :expiration_date
  default_scope -> { order(created_at: :asc) }
  validates :user, presence: true
  validates :expiration_date, presence: true
  validates :name, presence: true
  validate :purchase_date_cannot_be_in_the_future

  def expired?
    Time.now > (purchase_date + expiration_date.duration.days)
  end

  def expires_on
    purchase_date + expiration_date.duration.days
  end

  def expires_on_formatted
    self.expires_on.strftime("%b %d, %Y")
  end

  def time_until_expiration_in_words
    distance_of_time_in_words(purchase_date, Time.now - expiration_date.duration.days)
  end

  protected

    def purchase_date_cannot_be_in_the_future
      if purchase_date > Time.now
        errors.add(:purchase_date, "can't be in the future")
      end
    end
end
