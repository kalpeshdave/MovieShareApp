require 'rails_helper'

RSpec.describe "Homes", type: :request do
  let(:video) { Video.create!(user_id: user.id, url: "https://www.youtube.com/watch?v=8feLvQ4rshk") }
  let(:user) { User.create!(email: 'example@domain.com', password: '123123', password_confirmation: '123123') }

  describe "GET index" do

    before(:each) do
      video
    end

    it "returns a 200" do
      get '/'
      expect(response).to render_template("index")
      expect(response).to have_http_status(:ok)
      expect(assigns(:videos)).to eq([video])
    end
  end
end
