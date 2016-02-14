require "rails_helper"

feature "admin accesses list of all user appointments" do
  before(:each) do
    admin = create(:admin, email: "admin@test.com")
    login_as(admin, scope: :user)
  end

  scenario "without appointments" do
    visit appointments_path
    expect(page).to have_text("No se encontraron turnos.")
  end

  scenario "with booked appointments" do
    @booked_appointment = create(:appointment, status: :booked)
    visit appointments_path
    click_on "Turnos Solicitados"

    expect_to_see_list_of_booked_appointments
  end

  scenario "with confirmed appointments" do
    @confirmed_appointment = create(:appointment, status: :confirmed)
    visit appointments_path
    click_on "Turnos Confirmados"

    expect_to_see_list_of_confirmed_appointments
  end

  scenario "with cancelled appointments" do
    @cancelled_appointment = create(:appointment, status: :cancelled)
    visit appointments_path
    click_on "Turnos Cancelados"

    expect_to_see_list_of_cancelled_appointments
  end

  scenario "with all appointments" do
    car = create(:car)
    @booked_appointment = create(:appointment, car: car)
    @confirmed_appointment = create(:appointment, car: car)
    @cancelled_appointment = create(:appointment, car: car)
    visit appointments_path

    expect_to_see_list_of_all_appointments
  end

  private

  def expect_to_see_list_of_booked_appointments
    expect(page).to have_css("div.booked-appointments")
    expect(page).to have_css("td.date", text: @booked_appointment.date_on)
  end

  def expect_to_see_list_of_confirmed_appointments
    expect(page).to have_css("div.confirmed-appointments")
    expect(page).to have_css("td.date", text: @confirmed_appointment.date_on)
  end

  def expect_to_see_list_of_cancelled_appointments
    expect(page).to have_css("div.cancelled-appointments")
    expect(page).to have_css("td.date", text: @cancelled_appointment.date_on)
  end

  def expect_to_see_list_of_all_appointments
    expect(page).to have_css("div.all-appointments")
    expect(page).to have_css("td.date", text: @booked_appointment.date_on)
    expect(page).to have_css("td.date", text: @confirmed_appointment.date_on)
    expect(page).to have_css("td.date", text: @cancelled_appointment.date_on)
  end
end
