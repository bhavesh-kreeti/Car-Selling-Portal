require 'rails_helper'

RSpec.describe Model, type: :model do

	let(:model) { build(:model) }
	let(:model_duplicate) { build(:model) }
  
	describe 'Validation' do

		it 'should have model name' do
			brand = create(:brand)
			model.brand_id = brand.id
			expect(model).to be_valid
		end
		
		it 'model name cannot be nil' do
			model.name = nil
			expect(model.save).to eq(false)
		end
		it 'validates uniquenesss of model' do 
			model.save
			expect(model_duplicate).to_not be_valid
		end

	end

	describe "Association" do
		context "with seller" do
			it {should have_many(:sellers)}
		end
		context 'with model' do
			it { should belong_to(:brand) }
		end
	end

end
