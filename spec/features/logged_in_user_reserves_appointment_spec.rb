require "rails_helper"

feature "logged in user reserves appointment" do
  scenario "owning one car" do
    user = create(:user)
    car = create(:car, user: user)
    login_as(user, as: :user)
    visit dashboard_path

    click_on "Solicitar turno"
    expect(current_path).to eq(new_appointment_path)

    fill_in "Seleccione una fecha", with: Date.tomorrow
    fill_in "Seleccione un horario", with: Time.now.hour
    click_button "Solicitar turno"

    expect(current_path).to eq(dashboard_path)
    expect_to_see_successful_appointment_message
  end

  private

  def expect_to_see_successful_appointment_message
    expect(page).to have_css("div.flash-success", text: "El turno ha sido solicitado. Recibirá un correo electrónico cuando sea confirmado")
  end
end
