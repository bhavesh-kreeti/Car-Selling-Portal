class Brand < ApplicationRecord

  before_save :upcase_fields, if: :name?
  
  has_many :models
  has_many :sellers
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  
  private

  def upcase_fields
    self.name.upcase!
  end
end
