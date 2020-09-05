require 'rails_helper'

RSpec.describe Brand, type: :model do
let(:brand) { build(:brand) }	
let(:brand_duplicate) { build(:brand) }	

	describe ".validation" do 
		it 'brand name cannot be nil' do 
			brand.name = nil
			expect(brand).to_not be_valid
		end
			
		it 'brand name should be present' do 
			expect(brand).to be_valid
		end

		it ' brand name should be unique' do
			brand.save
      expect(brand_duplicate.save).to eq(false)
		end
	end

	describe "Association" do
		context "with seller" do 
			it { should have_many(:sellers) }
		end

		context "with model" do
			it { should have_many(:models) }
		end
	end

	describe "Scope" do
		it 'should do upper case before save' do
			brand.save
		  expect(brand.name).to eq('TATA')  
		end
	 end
end
