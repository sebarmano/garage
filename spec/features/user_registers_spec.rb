require "rails_helper"

feature "user registers" do
  scenario "after completing personal successfully data is redirected to car form" do
    visit root_path
    click_on t("navbar.login")

    expect(current_path).to eq(new_session_path)

    click_on "Registrarse"

    expect(current_path).to eq(new_registration_path)

    fill_in "Nombre", with: "Juan"
    fill_in "Apellido", with: "Pererz"
    fill_in "Teléfono", with: 12345678
    fill_in "Email", with: "juan@perez.com"
    fill_in "Contraseña", with: "password"
    fill_in "Repita la contraseña", with: "password"
    click_on "Registrarse"

    expect(current_path).to eq(new_car_path)
    expect_to_see_successfull_registration_message
  end

  private

  def expect_to_see_successfull_registration_message
    expect(page).to have_css('div.flash-notice', text: "Bienvenido a Garage, Juan!")
  end
end
