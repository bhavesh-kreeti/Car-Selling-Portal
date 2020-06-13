require 'rails_helper'

RSpec.describe Token, type: :model do
  subject { described_class.new(phoneno: "8910274860") } 
  describe "Validation" do 
		context 'validates presence of phone no' do 
      it { should validate_presence_of(:phoneno) }
		end
	end

	describe "Association" do
		context "with seller" do 
			it {should belong_to(:seller)}
    end
    context "with user" do
      it { should belong_to(:user) } 
    end
  end

  describe "length of phone no" do
    it 'should be between 10 digit and 12 digit' do
      phone_no = subject.phoneno.split('')
      expect(phone_no.length).to eq(10)  
    end
  end

end
