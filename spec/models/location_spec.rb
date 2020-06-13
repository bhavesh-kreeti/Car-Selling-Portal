require 'rails_helper'

RSpec.describe Location, type: :model do
  describe "Validation" do
    context "has to be present" do
      it { should validate_presence_of(:address) }
    end
  end
    context "Association" do
      context "with user" do
        it { should belong_to(:user) } 
      end  
    end
end