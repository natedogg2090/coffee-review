class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :roast

  def buy_now
    roast = Roast.find_by(:id => self.roast_id)
    user = User.find_by(:id => self.user_id)

    if user.money < roast.price
      "Sorry. You do not have enough money to purchase #{roast.name}."
    else
      rem_money = user.money - roast.price
      user.update(:money => rem_money)
      "Thanks for purchasing the #{roast.name} roast!"
    end
  end
end
