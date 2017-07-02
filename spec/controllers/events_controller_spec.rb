require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  describe "events#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
end
 

  describe "events#new action" do
    it "should require users to be logged in" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end


  describe "events#new action" do
    it "should successfully show the new events form" do
		  user = FactoryGirl.create(:user)
		  sign_in user


      get :new
      expect(response).to have_http_status(:success)
    end
end
  
  end
  end

