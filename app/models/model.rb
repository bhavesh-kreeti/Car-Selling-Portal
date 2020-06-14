class Model < ApplicationRecord
    validates :name, presence: true
    validates_uniqueness_of :name
    validates :brand_id, presence: true
      before_save :upcase_fields , if: :name?
      belongs_to :brand
      has_many :sellers

    private
    
    def upcase_fields
      self.name.upcase!
      end
  end