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
  scope :car_model, -> car_model_name { where(name: car_model_name )}
  scope :car_city, -> car_city_name { where(name: car_city_name )}
  scope :car_brand, -> car_brand_name { where(name: car_brand_name )}
  scope :car_reg_year, -> car_reg_year_name { where(name: car_reg_year_name )}
  scope :car_kilometer_driven, -> car_kilometer_driven_name { where(name: car_kilometer_driven_name )}
  scope :car_variant, -> car_variant_name { where(name: car_variant_name )}
  scope :car_reg_state, -> car_reg_state_name { where(name:  car_reg_state_name )}
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
