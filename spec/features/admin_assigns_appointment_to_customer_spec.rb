require "rails_helper"

feature "admin assigns appointment to customer" do
  before do
    admin = create(:user, :admin)
    login_as(admin, scope: :user)
    @appointment = create(:appointment, :uncompleted)
    visit appointments_path
    click_on "Turnos Incompletos"
    first(:link, "Agregar cliente").click
  end

  scenario "sees the appointment to assign in appointment assignments page" do
    expect(current_path).to eq(new_appointment_assignment_path)
    expect_to_see_appointment_to_assign
  end

  scenario "by creating a new customer" do
    expect_to_see_new_customer_form

    fill_in_new_customer_form
    click_button "Registrar cliente"

    expect(page).to have_css("div.flash-success")
  end

  scenario "by searching for an existing customer", js: true do
    skip "Learn why appointment id is not added to the form"
    customer = create(:customer)

    expect_to_see_customer_search_form

    fill_in "search", with: customer.lname
    click_on "Buscar"

    expect(page).to have_css("div.customer-card")
    expect(page).to have_content(customer.name)

    click_button "Dar turno"
  end

  private

  def expect_to_see_new_customer_form
    expect(page).to have_css("form#new_customer")
  end

  def fill_in_new_customer_form
    fill_in "Nombre", with: "Jose"
    fill_in "Apellido", with: "Fernandez"
    fill_in "Teléfono de contacto", with: "123456789"
    fill_in "Marca", with: "Ford"
    fill_in "Modelo", with: "Fiesta"
    fill_in "Patente", with: "AAA000"
  end

  def expect_to_see_customer_search_form
    expect(page).to have_css("div form.search-customer")
  end

  def expect_to_see_appointment_to_assign
    expect(page).to have_css("div.appointment-to-assign")
    expect(page).to have_content @appointment.date_on
  end
end
