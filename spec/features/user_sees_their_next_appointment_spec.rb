require "rails_helper"

feature "user sees their next appointment" do
  scenario "with one next appointment" do
    user = create :user
    car = create :car, user: user
    appointment = create :appointment, car: car
    visit dashboard_path

    expect(page).to have_text(appointment.starts_at)
  end
end
