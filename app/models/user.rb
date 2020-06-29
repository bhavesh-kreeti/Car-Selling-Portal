class User < ApplicationRecord 
    before_create :confirmation_token
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 105},
              format: { with: VALID_EMAIL_REGEX }
    validates_uniqueness_of :email
    has_secure_password
    has_many :locations 
    has_many :tokens
    has_many :sellers 
    belongs_to :role

    def email_activate
      self.email_confirm = true
      self.confirm_token = nil
      save!(:validate => false)
  end

    private

    def self.update_phoneno(phone_no,email)
      user = User.where(email: email)
      token = Token.where(user_id: user)
      token.update(phoneno: phone_no)
    end
    
    def confirmation_token
      if self.confirm_token.blank?
        self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
end
