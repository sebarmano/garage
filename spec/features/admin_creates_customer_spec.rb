require "rails_helper"

feature "admin creates new customer" do
  before do
    admin = create(:user, :admin)
    login_as(admin, scope: :user)
  end

  scenario "from dashboard" do
    visit dashboard_path
    click_on "Crear cliente"

    expect_to_see_new_customer_form

    fill_in_new_customer_form
    click_on "Registrar cliente"

    expect(page).to have_css("div.flash-success")
  end

  private

  def expect_to_see_new_customer_form
    expect(page).to have_css("form#new_customer")
  end

  def fill_in_new_customer_form
    fill_in "Nombre", with: "Jose"
    fill_in "Apellido", with: "Fernandez"
    fill_in "Teléfono de contacto", with: "123456789"
    fill_in "Brand", with: "Ford"
    fill_in "Model", with: "Fiesta"
    fill_in "License", with: "AAA000"
  end
end
