require 'rails_helper'

RSpec.describe Variant, type: :model do
  	
	describe 'Validation' do
		context 'validate presence of variant name' do
			it { should validate_presence_of(:name)}
		end
		context 'validates uniqueness of variant name' do
			it { should validate_uniqueness_of(:name)}
		end
	end

	describe "Association" do
		context "with seller" do
			it {should have_many(:sellers)}
		end
	end
end
