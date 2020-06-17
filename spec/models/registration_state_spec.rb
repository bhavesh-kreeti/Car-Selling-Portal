require 'rails_helper'

RSpec.describe RegistrationState, type: :model do
	let(:registration_state) { build(:registration_state) }
	let(:duplicate_registration_state) { build(:registration_state) }

  describe "Validation" do 
		it ' presence of registration state' do 
			expect(registration_state.save).to eq(true)
		end
		it ' registration state cannot be nil' do 
			registration_state.name = nil
			expect(registration_state.save).to eq(false)
		end
		it 'registration state should be unique' do 
			registration_state.save
			expect(duplicate_registration_state).to_not be_valid
		end
	end

	describe "Association" do
		context "with seller" do 
			it {should have_many(:sellers)}
    end
  end    
end
