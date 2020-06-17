require 'rails_helper'

RSpec.describe KilometerDriven, type: :model do
	let(:kilometer_driven) { build(:kilometer_driven) } 
	let(:kilometer_driven_duplicate) { build(:kilometer_driven) }  
  
  describe "Validation" do 
		it 'Kilometer driven cannot be blank' do 
			kilometer_driven.name = nil
			expect(kilometer_driven).to_not be_valid
		end

		it 'present of kilometer_driven ' do 
			expect(kilometer_driven).to be_valid
		end

		it 'kilometer_driven should be unique' do
			kilometer_driven.save
	    expect(kilometer_driven_duplicate).to_not be_valid
    end
	end

	describe "Association" do
		context "with seller" do 
			it {should have_many(:sellers)}
		end
	end
end
