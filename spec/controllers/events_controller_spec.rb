require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  describe "events#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'get index' do
    it 'index returns a 200' do
      expect(response).to have_http_status(200)
    end
  end

  	it 'shows all events' do
  		event = Event.new
  		event.save(validate: false)

  		get :index
  		expect(assigns(:events)).to eq [event]
  	end
  




		it "renders the #show view" do
    get :show, id:(:event)
    response.should render_template :show
  end

 
  describe "events#new action" do
    it "should require users to be logged in" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end
  end
end
 
  

