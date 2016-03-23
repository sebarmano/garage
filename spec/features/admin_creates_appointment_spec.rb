require "rails_helper"

feature "admin creates appointment" do
  scenario "whithout existing customer" do
    admin = create(:user, :admin)
    login_as(admin, scope: :user)
    @job_type = create(:job_type)

    visit dashboard_path
    click_on "Solicitud de turnos"
    expect_to_see_new_appointment_form_without_car_field

    fill_in_new_appointment_form
    click_on "Solicitar turno"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_css("div.flash-success")
  end

  scenario "from customer index page" do
    admin = create(:user, :admin)
    login_as(admin, scope: :user)
    @car = create(:car)
    @job_type = create(:job_type)

    visit customers_path

    expect_to_see_customer_table

    click_on "Dar turno"

    expect_to_see_new_appointment_form_with_customer_car

    fill_in_new_appointment_form
    click_on "Solicitar turno"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_css("div.flash-success")
  end

  private

  def expect_to_see_new_appointment_form_without_car_field
    expect(page).to have_css("form.new_appointment")
    expect(page).not_to have_css("select#appointment_car_id")
  end

  def expect_to_see_new_appointment_form_with_customer_car
    expect(page).to have_css("form.new_appointment")
    expect(page).to have_css("div.input.appointment_car_id option",
                             text: @car.description)
  end

  def fill_in_new_appointment_form
    fill_in "Seleccione una fecha", with: Date.today
    fill_in "Seleccione un horario", with: "10:00 AM"
    check @job_type.name
  end

  def expect_to_see_customer_table
    expect(page).to have_css("table.customers-table")
  end
end
