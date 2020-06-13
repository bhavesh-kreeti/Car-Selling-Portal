require 'rails_helper'

RSpec.describe Seller, type: :model do
  subject { described_class.new(city_id:1, model_id: 2, registration_state_id: 3, 
                            registration_year_id: 4, kilometer_driven_id: 5,
                            variant_id: 6, brand_id: 7,user_id: 8,buyer_id: 9 ) } 

    describe "Validation " do
      it { should validate_presence_of(:city_id) }
      it { should validate_presence_of(:model_id) }
      it { should validate_presence_of(:registration_year_id) }
      it { should validate_presence_of(:registration_state_id) }
      it { should validate_presence_of(:kilometer_driven_id) }
      it { should validate_presence_of(:variant_id) }
      it { should validate_presence_of(:brand_id) }
      it { should validate_presence_of(:user_id) }
      it { should validate_presence_of(:brand_id) }
    end

    describe "Association" do
        it { should belong_to(:city) }
        it { should belong_to(:model) }
        it { should belong_to(:brand) }
        it { should belong_to(:city) }
        it { should belong_to(:user) }
        it { should belong_to(:kilometer_driven) }
        it { should belong_to(:registration_state) }
        it { should belong_to(:registration_year) }
        it { should belong_to(:variant) }
        it { should have_many(:tokens) }
    end

    describe "Scope" do
      it 'should return seller where city id is ' do
        expect(described_class.car_city(1)).to  contain_exactly(*described_class.where(city_id: 1))
      end
      it 'should return seller where model id is ' do
        expect(described_class.car_model(1)).to  contain_exactly(*described_class.where(model_id: 2))
      end
      it 'should return seller where brand id is ' do
        expect(described_class.car_brand(1)).to  contain_exactly(*described_class.where(brand_id: 1))
      end
      it 'should return seller where registration year id is ' do
        expect(described_class.car_reg_year(1)).to  contain_exactly(*described_class.where(registration_year_id: 4))
      end
      it 'should return seller where registration state id is ' do
        expect(described_class.car_reg_state(1)).to  contain_exactly(*described_class.where(registration_state_id: 3))
      end
      it 'should return seller where kilometer driven id is ' do
        expect(described_class.car_kilometer_driven(1)).to  contain_exactly(*described_class.where(kilometer_driven_id: 5))
      end
      it 'should return seller where variant id is ' do
        expect(described_class.car_variant(1)).to  contain_exactly(*described_class.where(variant_id: 6))
      end

    end
    
end
