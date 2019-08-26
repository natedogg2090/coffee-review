class Roast < ApplicationRecord
  has_many :users
  belongs_to :roaster

  validates :name, :origin, :tasting_notes, :preparation_method, :price, presence: {message: "cannot be blank."}

end
