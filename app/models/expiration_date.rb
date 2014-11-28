class ExpirationDate < ActiveRecord::Base
  include ActiveModel::Validations

  belongs_to :food_type
  has_many :ingredients, dependent: :destroy
  validates :name, presence: true
  validate :at_least_one_duration

  def at_least_one_duration
    errors.add(:base, 'Duration must be specified for freezer or fridge.') unless freezer_duration | fridge_duration
  end
end
