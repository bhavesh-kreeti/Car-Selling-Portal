require 'rails_helper'

RSpec.describe Brand, type: :model do
	subject { described_class.create(name: 'tata') } 
	
	describe ".validation" do 
		context 'validates presence of brand name' do 
			it { should validate_presence_of(:name) }
		end
		context 'validate uniqueness of brand name' do 
			it { should validate_uniqueness_of(:name)}
		end
		it  'should be valid for' do
			expect(subject).to be_valid  
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
	describe "Scope" do
		it 'should do upper case before save' do
		  expect(subject.name).to eq('TATA')  
		end
	  end
end
