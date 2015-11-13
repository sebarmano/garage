require "rails_helper"

feature "user can reserve an appointment from home page" do
  scenario "sees the button to reserve appointment" do
    visit root_path

    expect(page).to have_link("Solicitar un turno")
  end

  scenario "without being logged in" do
    visit root_path
    click_link("Solicitar un turno")

    expect(current_path).to eq(new_appointment_path)
  end
end
