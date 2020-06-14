class RegistrationState < ApplicationRecord
    validates :name, presence: true
    validates_uniqueness_of :name
    before_save :upcase_fields, if: :name?
    has_many :sellers
    
    private
    
    def upcase_fields
      self.name.upcase!
    end
  end