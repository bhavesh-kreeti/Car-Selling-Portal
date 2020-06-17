class Location < ApplicationRecord
    validates :address, presence: true
    validates_uniqueness_of :address
    geocoded_by :address
    after_validation :geocode
    belongs_to :user
  
  end