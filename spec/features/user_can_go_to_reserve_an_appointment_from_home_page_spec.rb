require "rails_helper"

feature "user can go to reserve an appointment from home page" do
  scenario "sees the button to reserve appointment" do
    visit root_path

    expect(page).to have_link("Solicitar un turno")
  end

end
