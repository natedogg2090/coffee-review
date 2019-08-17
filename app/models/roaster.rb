class Roaster < ApplicationRecord
  has_many :roasts
  has_many :users, through: :roasts

end
