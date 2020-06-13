require 'rails_helper'

RSpec.describe KilometerDriven, type: :model do
  describe "Validation" do 
		context 'validates presence of Kilometer driven' do 
			it { should validate_presence_of(:name) }
		end
		context 'validate uniqueness of Kilometer driven' do 
			it { should validate_uniqueness_of(:name)}
		end
	end

	describe "Association" do
		context "with seller" do 
			it {should have_many(:sellers)}
		end

	end
end
