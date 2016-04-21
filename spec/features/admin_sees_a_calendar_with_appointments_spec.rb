require "rails_helper"

feature "admin sees a calendar with appointments" do
  before do
    admin = create(:user, :admin)
    login_as(admin, scope: :user)
  end

  scenario "accesses calendar from dahsboard" do
    visit dashboard_path
    click_on "Calendario"

    expect(current_path).to eq(calendar_path)
    expect(page).to have_css("div.simple-calendar")
  end

  scenario "sees active appointments short description in the calendar" do
    customer = create(:customer)
    car = create(:car, customer: customer)
    booked_appointment = create(:appointment,
                                :booked,
                                car: car,
                                date_on: Date.tomorrow,
                                starts_at: "8:00 AM")
    confirmed_appointment = create(:appointment,
                                   :confirmed,
                                   car: car,
                                   date_on: Date.tomorrow,
                                   starts_at: "10:00 AM")

    visit calendar_path

    expect(page).to have_css("td.day", text: Date.tomorrow.day)
    expect(page).to have_css("td.day div span.badge-booked", text:
                             booked_appointment.short_description)
    expect(page).to have_css("td.day div span.badge-confirmed", text:
                             confirmed_appointment.short_description)
  end

  scenario "doesn't see appointments that are not active" do
    create(:appointment, :uncompleted)

    visit calendar_path

    expect(page).not_to have_css("td.day div span.badge-uncompleted")
  end
end
