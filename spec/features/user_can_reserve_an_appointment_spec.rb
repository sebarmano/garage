require "rails_helper"

feature "user can reserve an appointment from home page" do
  scenario "without being logged in" do
    skip

    car = create(:car)
    visit root_path
    click_link("Solicitar un turno")

    expect(current_path).to eq(new_appointment_path)
    # expect(page).to have_content("Reserva de turnos")

    # select(Date.tomorrow, from: "Seleccione una fecha")
    # select(Time.now.hour, from: "Seleccione un horario")

    fill_in "Seleccione una fecha", with: Date.tomorrow
    fill_in "Seleccione un horario", with: Time.zone.now.hour
    fill_in "Vehículo", with: car.id

    click_on "Reservar turno"
    expect(current_path).to eq(dashboard_path)
  end
end
