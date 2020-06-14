
class CarCost < ApplicationRecord
    validates :condition, presence: true
    validates :price, presence: true
    validates_uniqueness_of :condition
    validates_uniqueness_of :price
  
    before_save :upcase_fields, if: :condition?
  
    private
    
    def upcase_fields
      self.condition.upcase!
      end
  
  end