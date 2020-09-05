class City < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :sellers
    before_save :upcase_fields, if: :name?

    private
    
    def upcase_fields
      self.name.upcase!
      end
  end




