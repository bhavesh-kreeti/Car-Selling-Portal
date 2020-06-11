
class CarCost < ApplicationRecord
    validates :condition, presence: true
    validates :price, presence: true
    validates :condition, uniqueness: { case_sensitive: false }
    validates :price, uniqueness: { case_sensitive: false }
  
    before_save :upcase_fields
  
    def upcase_fields
      self.condition.upcase!
      self.price.upcase!
      end
  
  end