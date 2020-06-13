class Variant < ApplicationRecord
    validates :name, presence: true
    validates_uniqueness_of :name
    has_many :sellers
    before_save :upcase_fields, if: :name?

    def upcase_fields
      self.name.upcase!
      end
  end