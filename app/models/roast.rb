class Roast < ApplicationRecord
  has_many :users
  belongs_to :roaster

  validates :name, presence: {message: "Cannot be blank."}
end
