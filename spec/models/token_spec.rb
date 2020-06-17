require 'rails_helper'

RSpec.describe Token, type: :model do
  let(:token) { build(:token)}
  before(:each) do
    seller = build(:seller)
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
    seller.save
    token.user_id = user.id
    token.seller_id = seller.id
  end

  describe "Validation" do 
		it 'presence of phone no' do 
      expect(token.save).to eq(true)
		end
    it 'phone no cannot be nil' do
      token.phoneno = nil
      expect(token.save).to eq(false)
    end
	end

	describe "Association" do
		context "with seller" do 
			it {should belong_to(:seller)}
    end
    context "with user" do
      it { should belong_to(:user) } 
    end
  end

  describe "length of phone no" do
    it 'should 10 digit ' do
      phone_no = token.phoneno.split('')
      expect(phone_no.length).to eq(10)  
    end
    it ' should not have phoe no length greater then 10 digit' do
      token.phoneno = '111111111111'
      expect(token).to_not be_valid
    end
  end

end
