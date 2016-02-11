require "rails_helper"

feature "user registers" do
  scenario "after completing valid personal data is redirected to car form" do
    visit root_path
    click_on t("navbar.login")

    expect(current_path).to eq(new_user_session_path)

    click_on "Registrarse"

    expect(current_path).to eq(new_user_registration_path)

    fill_in "Nombre", with: "Juan"
    fill_in "Apellido", with: "Pererz"
    fill_in "Teléfono", with: 12_345_678
    fill_in "Email", with: "juan@perez.com"
    fill_in "Contraseña", with: "password"
    fill_in "Repita la contraseña", with: "password"
    click_on "Registrarse"

    expect(current_path).to eq(new_car_path)
    expect_to_see_successful_user_creation_message

    fill_in "Marca", with: "Ford"
    fill_in "Modelo", with: "Escort"
    fill_in "Patente", with: "AAA111"
    click_on "Registrar vehículo"

    expect(current_path).to eq(dashboard_path)
    expect_to_see_successful_vehicle_creation_message
  end

  private

  def expect_to_see_successful_user_creation_message
    expect(page).to have_css("div.flash-notice",
                             text: t("devise.registrations.user.signed_up"))
  end

  def expect_to_see_successful_vehicle_creation_message
    expect(page).to have_css("div.flash-success",
                             text: t("models.cars.creation"))
  end
end
