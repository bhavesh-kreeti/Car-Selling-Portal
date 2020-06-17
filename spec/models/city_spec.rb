require 'rails_helper'
RSpec.describe City, type: :model do

let(:city) { build(:city) } 
let(:city_duplicate) { build(:city) }  

describe ".validation" do 

    it 'city name cannot be nil' do 
        city.name = nil
        expect(city).to_not be_valid
    end
      
    it 'city name should be present' do 
      expect(city.save).to eq(true)
    end

    it 'city name should be unique' do
      city.save
      expect(city_duplicate).to_not be_valid
    end
  end

  describe 'Association' do 
		it { is_expected.to have_many(:sellers)}
  end

  describe "Scope" do
    it 'should do upper case before save' do
      city.save
      expect(city.name).to eq('KOLKATA')  
    end
  end
  
end 