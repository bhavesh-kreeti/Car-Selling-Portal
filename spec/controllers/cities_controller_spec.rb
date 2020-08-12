require 'rails_helper'

RSpec.describe CitiesController, type: :controller do
  describe "GET index" do
    it “returns a successful response” do
      get :index
      expect(response).to be_successful
    end

    it "renders the index template" do
      
    end
  end
end
