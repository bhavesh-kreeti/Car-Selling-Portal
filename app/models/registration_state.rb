class RegistrationState < ApplicationRecord
    validates :name, presence: true
    validates_uniqueness_of :name
    after_create :upcase_fields, if: :name?
    has_many :sellers
    
    private
    
    def upcase_fields
      self.name.upcase!
    end
  end