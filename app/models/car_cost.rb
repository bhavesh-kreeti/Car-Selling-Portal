
class CarCost < ApplicationRecord
  before_save :upcase_fields, if: :condition?

  validates :condition, presence: true , uniqueness: { case_sensitive: false }
  validates :price, presence: true
  validates_uniqueness_of :price
  
  has_many :tokens

  private
  
  def upcase_fields
    self.condition.upcase!
  end
end
