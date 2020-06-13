require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(email:"something@example.com" , password_digest: 111111, role_id: 1) }

  describe "Validation" do
    context "presence of" do
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:password) }
      it { should validate_presence_of(:role_id) }
    end
    context "email should be of type" do
      it 'should not have only name' do
        subject.email = "something"
        expect(subject).to_not be_valid  
      end

      it 'should not have only @' do
        subject.email = "something@"
        expect(subject).to_not be_valid  
      end
      
      it 'should not have only name, @ and domain name' do
        subject.email = "something@example"
        expect(subject).to_not be_valid  
      end

      it 'should not have only @ and domain name' do
        subject.email = "@example"
        expect(subject).to_not be_valid  
      end

      it 'should not have only name, @ , domain name and .' do
        subject.email = "something@example."
        expect(subject).to_not be_valid  
      end

      it 'should have  name, @ , domain name . and com or co or in' do
        subject.email = "something@example.co"
        expect(subject).to_not be_valid  
      end

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
 