require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }

    it { should validate_uniqueness_of(:name) }

     it "is valid with valid city name" do
     	city =  City.new(name: "kolkata")
      expect(city).to be_valid
    end
  end

  describe 'Association' do 
		it { is_expected.to have_many(:sellers)}
  end
end