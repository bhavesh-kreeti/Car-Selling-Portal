
class CarCost < ApplicationRecord
    validates :condition, presence: true
    validates :price, presence: true
    validates_uniqueness_of :condition
    validates_uniqueness_of :price
  
    after_create :upcase_fields, if: :condition?
  
    private
    
    def upcase_fields
      self.condition.upcase!
      end
  
  end