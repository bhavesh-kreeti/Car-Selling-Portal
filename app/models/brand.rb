class Brand < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: { case_sensitive: false }
    has_many :models, dependent: :delete_all
    before_save :upcase_fields
  
    def upcase_fields
      self.name.upcase!
      end
  end