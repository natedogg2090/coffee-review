class Roast < ApplicationRecord
  has_many :users
  belongs_to :roaster
end
