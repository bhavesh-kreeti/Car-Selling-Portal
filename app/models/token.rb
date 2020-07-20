class Token < ApplicationRecord
  before_update :status_update
  belongs_to :user, foreign_key: "user_id"
  belongs_to :seller, foreign_key: "seller_id"
  belongs_to :car_cost
  validates :phoneno, presence: true , length: {is: 10}

  private
  def status_update
    self.status.upcase!
  end

end