require "rails_helper"

feature "admin creates new customer" do
  scenario "with an appointment of each status" do
    admin = create(:user, :admin)
    login_as(admin, scope: :user)

    car = create(:car)
    @booked_appointment = create(:appointment, car: car)
    @confirmed_appointment = create(:appointment, :confirmed, car: car)
    @cancelled_appointment = create(:appointment, :cancelled, car: car)
    @uncompleted_appointment = create(:appointment, :uncompleted, car: car)

    visit root_path
    click_on "Turnos"

    expect(page).to have_content("Gestión de Turnos")
    expect_to_see_table_with_appointment(:booked, @booked_appointment,
                                         "SOLICITADO")
    expect_to_see_table_with_appointment(:confirmed, @confirmed_appointment,
                                         "CONFIRMADO")
    expect_to_see_table_with_appointment(:cancelled, @cancelled_appointment,
                                         "CANCELADO")
    expect_to_see_table_with_appointment(:uncompleted, @uncompleted_appointment,
                                         "INCOMPLETO")
  end

  def expect_to_see_table_with_appointment(status, appointment, badge_text)
    expect(page).to have_css("div.#{status}-appointments span", text:
                             badge_text)
    expect(page).to have_css("div.#{status}-appointments td.date", text:
                             appointment.date_on)
  end
end
