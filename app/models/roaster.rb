class Roaster < ApplicationRecord
  has_many :roasts
  has_many :users, through: :roasts

  validates :name, presence: {message: "can't be blank"}

end
