class RegistrationYear < ApplicationRecord
    validates :name, presence: true
    has_many :sellers
  end