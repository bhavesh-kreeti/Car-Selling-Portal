class Model < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :brand_id, presence: true
    before_save :upcase_fields , if: :name?
    belongs_to :brand
    has_many :sellers

    private
    
    def upcase_fields
      self.name.upcase!
      end
  end