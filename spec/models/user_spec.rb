require 'rails_helper'

RSpec.describe User, type: :model do
let(:user) { build :user }

  before(:each) do
    role = create(:role)
    user.role_id = role.id
  end

  describe "Validation" do
    it "email cannot be nil" do
      user.email = nil
      expect(user.save).to eq(false)
    end

    it 'password cannot be nil' do
      user.password = nil
      expect(user.save).to eq(false)
    end

    it 'should not accept email not having form  _____@____.____' do
      user.email = 'hello@'
      expect(user).to_not be_valid  
    end

    it 'email cannot be empty' do
      user.email = nil
      expect(user).to_not be_valid  
    end

    it 'email should be of form _____@____.____' do
      expect(user).to be_valid  
    end
  end

  describe "has secure password" do
    it { should have_secure_password }
  end
  
  describe "Association" do
    context "with location" do
      it { should have_many(:locations) }
    end
    context "with token" do
      it { should have_many(:tokens) }
    end
    context "with seller" do
      it { should have_many(:sellers) }      
    end
    context "with role" do
      it { should belong_to(:role) } 
    end    
  end
end
 