class Location < ApplicationRecord
    validates :address, presence: true
    geocoded_by :address
    after_validation :geocode
    belongs_to :user
    before_save :upcase_fields, if: :address?
  
    def upcase_fields
        self.address.upcase!
    end
  end