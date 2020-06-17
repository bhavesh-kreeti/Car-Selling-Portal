require 'rails_helper'

RSpec.describe Seller, type: :model do
  let(:seller) { build(:seller)}
  
  before(:each) do 
  city = create(:city)
  brand = create(:brand)
  model = build(:model)
  model.brand_id = brand.id
  model.save
  registration_state = create(:registration_state)
  registration_year = create(:registration_year)
  kilometer_driven = create(:kilometer_driven)
  variant = create(:variant)
  user = build(:user)
  role = create(:role)
  user.role_id = role.id
  user.save
  seller.city_id = city.id
  seller.registration_year_id = registration_year.id
  seller.registration_state_id = registration_state.id
  seller.variant_id = variant.id
  seller.kilometer_driven_id = kilometer_driven.id
  seller.user_id = user.id
  seller.brand_id = brand.id
  seller.model_id =  model.id
  end

    describe "Validation " do

      describe 'city' do
        it 'city id cannot be nul' do
          seller.city_id = nil
          expect(seller.save).to eq(false)
        end
        it 'city id must be present' do
          expect(seller).to be_valid
        end
      end

      describe 'brand' do
        it 'brand id cannot be nul' do
          seller.brand_id = nil
          expect(seller.save).to eq(false)
        end
        it 'brand id must be present' do
          expect(seller).to be_valid
        end
      end

      describe 'model' do
        it 'model id cannot be nul' do
          seller.model_id = nil
          expect(seller.save).to eq(false)
        end
        it 'model id must be present' do
          expect(seller).to be_valid
        end
      end 

      describe 'registration_year' do
        it 'registration_year id cannot be nul' do
          seller.registration_year_id = nil
          expect(seller.save).to eq(false)
        end
        it 'registration_year id must be present' do
          expect(seller).to be_valid
        end
      end

      describe 'registration_state' do
        it 'registration_state id cannot be nul' do
          seller.registration_state_id = nil
          expect(seller.save).to eq(false)
        end
        it 'registration_state id must be present' do
          expect(seller).to be_valid
        end
      end
 
      describe 'kilometer_driven' do
        it 'kilometer_driven id cannot be nul' do
          seller.kilometer_driven_id = nil
          expect(seller.save).to eq(false)
        end
        it 'kilometer_driven id must be present' do
          expect(seller).to be_valid
        end
      end
 
      describe 'variant' do
        it 'variant id cannot be nul' do
          seller.variant_id = nil
          expect(seller.save).to eq(false)
        end
        it 'variant id must be present' do
          expect(seller).to be_valid
        end
      end

      describe 'user' do
        it 'user id cannot be nul' do
          seller.user_id = nil
          expect(seller.save).to eq(false)
        end
        it 'user id must be present' do
          expect(seller).to be_valid
        end
      end
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
      context '.city' do
        it 'should return seller where city id is ' do
          expect(described_class.car_city(1)).to  contain_exactly(*described_class.where(city_id: 1))
        end
        it 'should have unique city id' do
          expect(described_class.car_city(2)).to_not eq(described_class.first)
        end
      end
      context '.model' do
        it 'should return seller where model id is ' do
          expect(described_class.car_model(1)).to  contain_exactly(*described_class.where(model_id: 2))
        end
        it 'should have unique model id' do
          expect(described_class.car_model(2)).to_not eq(described_class.first)
        end
      end

      context '.brand' do
        it 'should return seller where brand id is ' do
          expect(described_class.car_brand(1)).to  contain_exactly(*described_class.where(brand_id: 1))
        end
        it 'should have unique brand id' do
          expect(described_class.car_brand(2)).to_not eq(described_class.first)
        end
      end

      context '.registration_year' do
        it 'should return seller where registration year id is ' do
          expect(described_class.car_reg_year(1)).to  contain_exactly(*described_class.where(registration_year_id: 4))
        end
        it 'should have unique city id' do
          expect(described_class.car_reg_year(2)).to_not eq(described_class.first)
        end
      end

      context '.registration_state' do
        it 'should return seller where registration state id is ' do
          expect(described_class.car_reg_state(1)).to  contain_exactly(*described_class.where(registration_state_id: 3))
        end
        it 'should have unique registration state id' do
          expect(described_class.car_reg_state(2)).to_not eq(described_class.first)
        end
      end

      context '.kilometer_driven' do
        it 'should return seller where kilometer driven id is ' do
          expect(described_class.car_kilometer_driven(1)).to  contain_exactly(*described_class.where(kilometer_driven_id: 5))
        end
        it 'should have unique kilometer driven id' do
          expect(described_class.car_kilometer_driven(2)).to_not eq(described_class.first)
        end
      end

      context '.variant' do
        it 'should return seller where variant id is ' do
          expect(described_class.car_variant(1)).to  contain_exactly(*described_class.where(variant_id: 6))
        end
        it 'should have unique variant id' do
          expect(described_class.car_variant(2)).to_not eq(described_class.first)
        end
      end
    end
    
end
