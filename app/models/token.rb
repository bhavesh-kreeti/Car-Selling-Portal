class Token < ApplicationRecord
  before_update :status_update

  validates :phoneno,          presence: true , length: {is: 10}
  validates :appointment_date, presence: true
  belongs_to :user,   foreign_key: "user_id"
  belongs_to :seller, foreign_key: "seller_id"
  belongs_to :car_cost

  private
  def status_update
    self.status.upcase!
  end
end
