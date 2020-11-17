require 'rails_helper'

RSpec.describe "Videos", type: :request do

  before do
    @user = FactoryGirl.create(:user)

    sign_in @user
  end

  describe "GET new" do

    it "returns a 200" do
      get '/videos/new'
      expect(response).to render_template("new")
      expect(response).to have_http_status(:ok)
      expect(assigns(:video)).to be_a_new(Video)
    end
  end

end
