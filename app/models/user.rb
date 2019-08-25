class User < ApplicationRecord
  has_many :roasts
  has_many :roasters, through: :roasts
  has_secure_password

  def self.find_or_create_by_omniauth(auth_hash)
    where(:name => auth_hash[:info][:name]).first_or_create do |user|
      user.password = SecureRandom.hex
      user.money = 0
      user.admin = false
    end
  end
  
end
