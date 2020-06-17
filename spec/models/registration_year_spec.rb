require 'rails_helper'

RSpec.describe RegistrationYear, type: :model do
	let(:registration_year) { build(:registration_year) }
	let(:duplicate_registration_year) {build(:registration_year) }

  describe "Validation" do 
		it ' presence of registration year' do 
			expect(registration_year.save).to eq(true)
		end
		it 'cannot be nil' do
			registration_year.name = nil
			expect(registration_year.save).to eq(false)
		end
		it 'uniqueness of registration year' do 
			registration_year.save
			expect(duplicate_registration_year).to_not be_valid
		end
	end

	describe "Association" do
		context "with seller" do 
			it {should have_many(:sellers)}
    end
  end    
end
