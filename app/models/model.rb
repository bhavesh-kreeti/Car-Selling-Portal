class Model < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: { case_sensitive: false }
      before_save :upcase_fields
      belongs_to :brand
    def upcase_fields
      self.name.upcase!
      end
  end