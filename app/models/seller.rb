class Seller < ApplicationRecord
  
  belongs_to :brand, foreign_key: "brand_id"
  belongs_to :user, foreign_key: "user_id"
  belongs_to :city, foreign_key: "city_id"
  belongs_to :kilometer_driven, foreign_key: "kilometer_driven_id"
  belongs_to :registration_state, foreign_key: "registration_state_id"
  belongs_to :registration_year, foreign_key: "registration_year_id"
  belongs_to :model, foreign_key: "model_id"
  belongs_to :variant, foreign_key: "variant_id"
  has_many :tokens
  validates :brand_id, presence: true
  validates :registration_state_id, presence: true
  validates :city_id, presence: true
  validates :kilometer_driven_id, presence: true
  validates :registration_year_id, presence: true 
  validates :model_id, presence: true
  validates :variant_id, presence: true
  validates :user_id, presence: true
  scope :car_model, -> car_model_id { where(model_id: car_model_id )}
  scope :car_city, -> car_city_id { where(city_id: car_city_id )}
  scope :car_brand, -> car_brand_id { where(brand_id: car_brand_id )}
  scope :car_reg_year, -> car_reg_year_id { where(registration_year_id: car_reg_year_id )}
  scope :car_kilometer_driven, -> car_kilometer_driven_id { where(kilometer_driven_id: car_kilometer_driven_id )}
  scope :car_variant, -> car_variant_id { where(variant_id: car_variant_id )}
  scope :car_reg_state, -> car_reg_state_id { where(registration_state_id:  car_reg_state_id )}
  searchkick

  def search_data
    {
      city: city.name,
      model: model.name,
      registration_year: registration_year.name,
      variant: variant.name,
      kilometer_driven: kilometer_driven.name,
      registration_state: registration_state.name,
      brand: brand.name
    }
  end

end