
class CarCost < ApplicationRecord
    validates :condition, presence: true , uniqueness: { case_sensitive: false }

    validates :price, presence: true
    validates_uniqueness_of :price
    has_many :tokens
    before_save :upcase_fields, if: :condition?
  
    private
    
    def upcase_fields
      self.condition.upcase!
      end
  
  end