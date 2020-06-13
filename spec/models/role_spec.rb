require 'rails_helper'

RSpec.describe Role, type: :model do
  subject { described_class.new(roles: "ADMIN") }
  describe "Validation" do 
		context 'validates presence of role' do 
			it { should validate_presence_of(:roles) }
		end
		context 'validate uniqueness of role' do 
			it { should validate_uniqueness_of(:roles)}
		end
	end

	describe "Association" do
		context "with seller" do 
			it {should have_many(:users)}
    end
  end    
end
