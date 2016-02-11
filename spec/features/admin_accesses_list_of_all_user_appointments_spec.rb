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
    skip "decide the way of showing the appointments"
    @booked_appointment = create(:appointment, status: :booked)
    visit appointments_path

    expect_to_see_list_of_booked_appointments
  end

  scenario "with cancelled appointments" do
    skip "decide the way of showing the appointments"
    @cancelled_appointment = create(:appointment, status: :cancelled)
    visit appointments_path

    expect_to_see_list_of_cancelled_appointments
  end

  private

  def expect_to_see_list_of_booked_appointments
    expect(page).to have_css("section.booked-appointments h1",
                            text: "Turnos solicitados")
  end

  def expect_to_see_list_of_cancelled_appointments
    expect(page).to have_css("section.cancelled-appointments h2",
                            text: "Turnos cancelados")
    expect(page).to have_css("section.cancelled-appointments ul li.appointment",
                            text: @cancelled_appointment.date_on)
  end
end
