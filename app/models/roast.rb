class Roast < ApplicationRecord
  has_many :purchases
  has_many :users, through: :purchases
  belongs_to :roaster
  

  validates :name, :origin, :tasting_notes, :preparation_method, :price, presence: {message: "cannot be blank."}
  validate :date_not_in_future

  def date_not_in_future
    if roasted_date > Date.today
      errors.add(:roasted_date, "cannot be in the future.")
    end
  end

end
