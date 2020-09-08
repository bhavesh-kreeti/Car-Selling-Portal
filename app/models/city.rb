class City < ApplicationRecord
  before_save :upcase_fields, if: :name?

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :sellers

  private
  
  def upcase_fields
    self.name.upcase!
  end
end
