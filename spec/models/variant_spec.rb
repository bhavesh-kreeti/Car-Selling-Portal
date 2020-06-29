require 'rails_helper'

RSpec.describe Variant, type: :model do
  	
	
let(:variant) { build(:variant) } 
let(:variant_duplicate) { build(:variant) }  

describe ".validation" do 

    it 'variant name cannot be nil' do 
        variant.name = nil
        expect(variant).to_not be_valid
    end
      
    it 'variant name should be present' do 
      expect(variant.save).to eq(true)
    end

    it 'variant name should be unique' do
      variant.save
      expect(variant_duplicate.save).to eq(false)
    end
  end

	describe "Association" do
		context "with seller" do
			it {should have_many(:sellers)}
		end
	end

	 describe "Scope" do
    it 'should do upper case before save' do
      variant.save
      expect(variant.name).to eq('PETROL')  
    end
  end
end
