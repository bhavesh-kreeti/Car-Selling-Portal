require 'rails_helper'

RSpec.describe KilometerDriven, type: :model do
	subject { described_class.create(name: '0-10000') } 
  describe "Validation" do 
		context 'validates presence of Kilometer driven' do 
			it { should validate_presence_of(:name) }
		end
		context 'validate uniqueness of Kilometer driven' do 
			it { should validate_uniqueness_of(:name).case_insensitive}
		end
		it 'should be valid for' do
			expect(subject).to be_valid  
		end
	end

	describe "Association" do
		context "with seller" do 
			it {should have_many(:sellers)}
		end
	end
end
