require "rails_helper"

feature "user sees their next appointment" do
  before :each do
    @user = create :confirmed_user
    login_as(@user, scope: :user)
  end
  scenario "with one next appointment" do
    car = create :car, user: @user
    @appointment = create :appointment, car: car
    visit dashboard_path

    expect(page).to have_text(@appointment.starts_at)
  end

  scenario "without next appointments" do
    visit dashboard_path

    expect(page).to have_text("No tiene próximos turnos")
  end
end
