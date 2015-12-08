require "rails_helper"

feature "User sees navbar depending on role" do
  scenario "when is a customer sees book appointments link" do
    customer = create(:customer)
    login_as(customer, scope: :user)

    visit dashboard_path
    expect(page).to have_text("Solicitud de turnos")
  end

  scenario "when is an admin sees button to see list of appointments" do
    admin = create(:admin)
    login_as(admin, scope: :user)

    visit dashboard_path
    expect(page).to have_text("Turnos")
  end
end
