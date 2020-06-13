require 'rails_helper'

RSpec.describe RegistrationYear, type: :model do
  subject { described_class.new(name: 2020) } 
  describe "Validation" do 
		context 'validates presence of registration year' do 
			it { should validate_presence_of(:name) }
		end
		context 'validate uniqueness of registration year' do 
			it { should validate_uniqueness_of(:name).case_insensitive}
		end
	end

	describe "Association" do
		context "with seller" do 
			it {should have_many(:sellers)}
    end
  end    
end
