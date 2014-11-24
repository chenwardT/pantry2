class Ingredient < ActiveRecord::Base
  belongs_to :user
  belongs_to :expiration_date
  default_scope -> { order(created_at: :asc) }
  validates :user_id, presence: true
  validates :expiration_date_id, presence: true
end
