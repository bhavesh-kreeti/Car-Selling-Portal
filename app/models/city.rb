class City < ApplicationRecord
    validates :name, presence: true
    validates_uniqueness_of :name
	 has_many :sellers
    after_create :upcase_fields, if: :name?
  
    private
    
    def upcase_fields
      self.name.upcase!
      end
  end




