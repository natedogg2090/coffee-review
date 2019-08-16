class User < ApplicationRecord
  has_many :roasts
  has_many :roasters, through: :roasts
  
end
