class Location < ApplicationRecord
  after_validation :geocode
  geocoded_by :address
  
  validates :address, presence: true, uniqueness: { case_sensitive: false }
  
  belongs_to :user
end
