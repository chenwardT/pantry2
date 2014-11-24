class ExpirationDate < ActiveRecord::Base
  has_many :ingredients   # Should this have dependent: :destroy ?
end
