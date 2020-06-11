class City < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: { case_sensitive: false }
    
    before_save :upcase_fields
  
    def upcase_fields
      self.name.upcase!
      end
  end