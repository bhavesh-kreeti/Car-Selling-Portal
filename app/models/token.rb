class Token < ApplicationRecord
  before_update :status_update
  belongs_to :user
  belongs_to :seller
  belongs_to :car_cost
  validates :phoneno, presence: true , length: {is: 10}

  private
  def status_update
    self.status.upcase!
  end

end