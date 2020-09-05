require 'rails_helper'

RSpec.describe Token, type: :model do
  let(:token) { build(:token)}

  describe "Validation" do
    it 'presence of phone no' do
      token.phoneno = nil
      expect(token.save).to eq(false)
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
    it 'should 10 digit ' do
      phone_no = token.phoneno.split('')
      expect(phone_no.length).to eq(10)  
    end
    it ' should not have phoe no length greater then 10 digit' do
      token.phoneno = '111111111111'
      expect(token).to_not be_valid
    end
  end

end
