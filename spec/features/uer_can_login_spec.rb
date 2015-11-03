require "rails_helper"

feature "user can login" do
  context "succesfully" do
    before :each do
      @user = create(:user)
      visit dashboard_path
    end

    scenario "if not authenticated,  is redirected  to login page" do
      expect(current_path).to eq(new_user_session_path)
    end

    scenario "fills form to be authenticated" do
      fill_in "user_email", with: @user.email
      fill_in "user_password", with: @user.password
      click_button "Log in"

      expect(current_path).to eq(dashboard_path)
    end
  end
end
