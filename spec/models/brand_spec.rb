require 'rails_helper'

RSpec.describe Brand, type: :model do
	describe "Validation" do 
		context 'validates presence of brand name' do 
			it { should validate_presence_of(:name) }
		end
		context 'validate uniqueness of brand name' do 
			it { should validate_uniqueness_of(:name)}
		end
	end

	describe "Association" do
		context "with seller" do 
			it {should have_many(:sellers)}
		end

		context "with model" do
			it { should have_many(:models)}
		end
	end
end
