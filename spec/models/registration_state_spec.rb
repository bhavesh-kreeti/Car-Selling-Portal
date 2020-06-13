require 'rails_helper'

RSpec.describe RegistrationState, type: :model do
  subject { described_class.new(name: "west bengal") } 
  describe "Validation" do 
		context 'validates presence of registration state' do 
			it { should validate_presence_of(:name) }
		end
		context 'validate uniqueness of registration state' do 
			it { should validate_uniqueness_of(:name)}
		end
	end

	describe "Association" do
		context "with seller" do 
			it {should have_many(:sellers)}
    end
  end    
end
