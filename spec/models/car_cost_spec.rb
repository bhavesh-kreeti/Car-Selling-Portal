require 'rails_helper'

RSpec.describe CarCost, type: :model do
	subject { described_class.create(price: "5000" , condition: 'fair')}

	describe "Validation" do
		context " of car cost" do
			it { should validate_presence_of(:price)}
			it { should validate_uniqueness_of(:price).case_insensitive}
		end
		context 'of car condition' do
			it { should validate_presence_of(:condition)}
			it { should validate_uniqueness_of(:condition)}
		end
		it 'should be valid for ' do
			expect(subject).to be_valid  
		end
	end

	describe "Scope" do
		it 'should do upper case before save' do
		  expect(subject.condition).to eq('FAIR')  
		end
	  end

end
