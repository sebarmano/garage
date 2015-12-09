require "rails_helper"

feature "user can access login page from home page" do
  context "without being logged in" do
    scenario "sees login button" do
      visit root_path
      expect(page).to have_link("Ingresar")
    end
  end
end
