class Location < ApplicationRecord
    validates :address, presence: true, uniqueness: { case_sensitive: false }

    geocoded_by :address
    after_validation :geocode
    belongs_to :user
  end