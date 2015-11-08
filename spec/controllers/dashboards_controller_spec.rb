require "rails_helper"

RSpec.describe DashboardsController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      user = create(:confirmed_user)
      sign_in user
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
