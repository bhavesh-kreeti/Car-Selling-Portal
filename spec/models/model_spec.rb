require 'rails_helper'

RSpec.describe Model, type: :model do

  
	describe 'Validation' do
		context 'validate presence of city name' do
			it { should validate_presence_of(:name)}
		end
		context 'validates uniqueness of model name' do
			it { should validate_uniqueness_of(:name)}
		end
		context 'validates presence of brand id' do 
			it { should validate_presence_of(:brand_id)}
		end

	end

	describe "Association" do
		context "with seller" do
			it {should have_many(:sellers)}
		end
		context 'with brand' do
			it { should belong_to(:brand) }
		end
	end

end
