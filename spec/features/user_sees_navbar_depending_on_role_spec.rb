require "rails_helper"

feature "User sees navbar depending on role" do
  scenario "when is a customer sees book appointments link" do
    user = create(:user)
    login_as(user, scope: :user)

    visit dashboard_path
    expect(page).to have_text("Solicitud de turnos")
    expect(page).to have_text("Panel de Control")
  end

  scenario "when is an admin sees button to see list of appointments" do
    admin = create(:admin)
    login_as(admin, scope: :user)

    visit dashboard_path
    expect(page).to have_text("Turnos")
    expect(page).to have_text("Solicitud de turnos")
  end
end
