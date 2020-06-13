class Seller < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  belongs_to :city
  belongs_to :kilometer_driven
  belongs_to :registration_state
  belongs_to :registration_year
  belongs_to :model
  belongs_to :variant
  has_many :tokens
  validates :brand_id, presence: true
  validates :registration_state_id, presence: true
  validates :city_id, presence: true
  validates :kilometer_driven_id, presence: true
  validates :registration_year_id, presence: true 
  validates :model_id, presence: true
  validates :variant_id, presence: true
  validates :buyer_id, presence: true
  validates :user_id, presence: true

  scope :car_model, -> car_model_id { where(model_id: car_model_id )}
  scope :car_city, -> car_city_id { where(city_id: car_city_id )}
  scope :car_brand, -> car_brand_id { where(brand_id: car_brand_id )}
  scope :car_reg_year, -> car_reg_year_id { where(registration_year_id: car_reg_year_id )}
  scope :car_kilometer_driven, -> car_kilometer_driven_id { where(kilometer_driven_id: car_kilometer_driven_id )}
  scope :car_variant, -> car_variant_id { where(variant_id: car_variant_id )}
  scope :car_reg_state, -> car_reg_state_id { where(registration_state_id:  car_reg_state_id )}
  
end