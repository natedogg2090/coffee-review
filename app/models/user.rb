class User < ApplicationRecord
  has_many :roasts
  has_many :roasters, through: :roasts
  has_secure_password
  
end
