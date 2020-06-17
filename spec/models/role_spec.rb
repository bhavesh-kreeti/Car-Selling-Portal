require 'rails_helper'

RSpec.describe Role, type: :model do

	let(:role) { build(:role) }
	let(:duplicate_role) { build(:role) }

  describe "Validation" do 
		it 'validates presence of role' do 
			expect(role.save).to eq(true)
		end
		it 'role cannot be null' do 
			role.roles = nil
			expect(role.save).to eq(false)
		end
		it 'role to be unique' do
			role.save
			expect(duplicate_role).to_not be_valid
		end
	end

	describe "Association" do
		context "with seller" do 
			it {should have_many(:users)}
    end
  end    
end
