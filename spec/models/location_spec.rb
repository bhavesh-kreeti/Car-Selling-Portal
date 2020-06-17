require 'rails_helper'

RSpec.describe Location, type: :model do
let(:user2) { create(:user) }
let(:location) { build(:location) }
let(:location_duplicate) { build(:location) }
  context 'Validation' do
    it 'address cannot be nil' do
      location.address = nil
      expect(location.save).to eq(false)
    end
    it 'address must be present' do
      user = build(:user)
      role = create(:role)
      user.role_id = role.id
      user.save
      location.user_id = user.id
      expect(location.save).to eq(true)
    end

    it 'address sholud be unique' do
      location.save
      expect(location_duplicate).to_not be_valid
    end

  end

    context "Association" do
      context "with user" do
      it { is_expected.to belong_to(:user) } 
      end  
    end
end 