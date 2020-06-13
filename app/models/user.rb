class User < ApplicationRecord 

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 105 }
    validates :role_id, presence: true

    validates_uniqueness_of :email,
                            format: { with: VALID_EMAIL_REGEX }
    has_secure_password
    has_many :locations 
    has_many :tokens
    has_many :sellers 
    belongs_to :role
end
