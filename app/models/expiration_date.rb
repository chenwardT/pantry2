class ExpirationDate < ActiveRecord::Base
  include ActiveModel::Validations

  has_many :ingredients, dependent: :destroy
  validates :name, presence: true
  validates :duration, presence: true
  validate :storage

  def storage
    errors.add(:base, 'Storage must be specified as freezer, fridge, or pantry.') unless in_freezer | in_fridge | in_pantry
  end
end
