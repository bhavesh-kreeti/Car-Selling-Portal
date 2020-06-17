require 'rails_helper'

RSpec.describe CarCost, type: :model do

let(:car_cost) { build(:car_cost) }
let(:car_cost_duplicate) { build(:car_cost) }

	describe "Validation" do

		it 'condition cannot be nil'  do
			car_cost.condition = nil
			expect(car_cost).to_not be_valid
		end
		it 'price cannot be nil' do
			car_cost.price = nil
			expect(car_cost).to_not be_valid
		end

		it 'condition  should be present'  do
			expect(car_cost).to be_valid
		end

		it 'price must be present' do
			expect(car_cost).to be_valid
		end

		it 'price must be unique' do
			car_cost.save
			car_cost_duplicate.condition = 'good'
			expect(car_cost_duplicate).to_not be_valid
		end

		it 'condition must be unique'  do
			car_cost.save
			expect(car_cost_duplicate).to_not be_valid
		end
	end

	describe "Scope" do
		it 'should do upper case before save' do
			car_cost.save
		  expect(car_cost.condition).to eq('FAIR')  
		end
  end
end
