require "rails_helper"

feature "admin edits assignment" do
  scenario "from the appointments details page" do
    create_and_login_admin
    assignment = create(:assignment)
    appointment = create(:appointment, assignments: [assignment])

    visit appointment_path(appointment)
    first(:link, "Editar").click

    expect(page).to have_current_path(edit_assignment_path(assignment))
  end

  scenario "by adding notes to it" do
    create_and_login_admin
    assignment = create(:assignment)

    visit edit_assignment_path(assignment)
    fill_in "Notas", with: "This is the assignment note."
    click_on "Agregar nota"

    expect(page).to have_css("div.flash-success")
    expect(page).to have_css("li.note", text: "This is the assignment note.")
  end

  scenario "by changing its status" do
    create_and_login_admin
    assignment = create(:assignment, status: :active)

    visit edit_assignment_path(assignment)
    click_on "Comenzar"

    expect(page).to have_css("div.flash-success")
    expect(page).to have_css("div.assignment-details", text: "en curso")

    click_on "Finalizar"

    expect(page).to have_css("div.flash-success")
    expect(page).to have_css("div.assignment-details", text: "completado")
  end

  private

  def create_and_login_admin
    login_as(create(:admin), scope: :user)
  end
end
