class User < ApplicationRecord 

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 105 },
    uniqueness: { case_sensitive: false },
    format: { with: VALID_EMAIL_REGEX }
    has_secure_password
    has_many :locations 
    has_many :tokens
    has_many :sellers 
    belongs_to :role
end
