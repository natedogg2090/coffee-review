class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :roaster
end
