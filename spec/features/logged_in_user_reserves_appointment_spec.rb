require "rails_helper"

feature "Logged in user reserves appointment" do
  scenario "owning one car" do
    skip "Not working for the moment, need to fix"
    user = create(:user)
    create(:car, user: user)
    login_as(user, as: :user)
    visit dashboard_path

    click_on "Solicitud de turnos"
    expect(current_path).to eq(new_appointment_path)

    # save_and_open_page
    # click_on "Seleccione un horario"
    # click_on "10:00 AM"
    fill_in "appointment[date_on]", with: Time.zone.now.hour
    expect(page).to have_field("appointment[starts_at]")
    fill_in "appointment[starts_at]", with: "10:00 AM"

    expect(current_path).to eq(dashboard_path)
    expect_to_see_successful_appointment_message
  end

  private

  def expect_to_see_successful_appointment_message
    expect(page).to have_css("div.flash-success",
                             text: "El turno ha sido solicitado. "\
                             "Recibirá un correo electrónico "\
                             "cuando sea confirmado.")
  end
end
