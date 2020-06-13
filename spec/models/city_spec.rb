require 'rails_helper'
RSpec.describe City, type: :model do
  subject { described_class.create(name: 'kolkata') } 

  describe 'validation' do
    it { should validate_presence_of(:name) }

    it { should validate_uniqueness_of(:name) }

     it "is valid with valid city name" do
      expect(subject).to be_valid
    end
  end

  describe 'Association' do 
		it { is_expected.to have_many(:sellers)}
  end

  describe "Scope" do
    it 'should do upper case before save' do
      expect(subject.name).to eq('KOLKATA')  
    end
  end
  
end