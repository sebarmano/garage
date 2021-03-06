require "rails_helper"

feature "Logged in user bookes appointment" do
  scenario "owning one car" do
    customer = create(:customer)
    user = create(:user, customer: customer)
    create(:car, customer: customer)
    login_as(user, as: :user)
    @job_type = create(:job_type)
    visit dashboard_path

    click_on "Solicitud de turnos"
    expect(current_path).to eq(new_appointment_path)

    expect_to_see_new_appointment_form

    fill_in_new_appointment_form
    click_on "Solicitar turno"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_css("div.flash-success")
  end

  private
  def expect_to_see_new_appointment_form
    expect(page).to have_css("form.new_appointment")
  end

  def fill_in_new_appointment_form
    fill_in "Seleccione una fecha", with: Date.today
    fill_in "Seleccione un horario", with: "10:00 AM"
    check @job_type.name
  end
end
