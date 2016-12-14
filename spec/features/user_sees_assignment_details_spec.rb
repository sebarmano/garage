# frozen_string_literal: true
require "rails_helper"

feature "User sees assignment details" do
  context "as an admin" do
    scenario "from the appointments list" do
      create_and_login_admin
      customer = create(:customer, fname: "Mary", lname: "Jane")
      car = create(:car, brand: "Volkswagen",
                         model: "Golf",
                         license: "AAA123",
                         customer: customer)
      job = create(:job_type, name: "Change Tires")
      assignment = create(:assignment, job_type: job)
      create(:appointment, assignments: [assignment], car: car)

      visit appointments_path
      click_on "Todos"
      first(:link, "Ver detalles").click
      first(:link, "Editar").click

      expect(page).to have_current_path(edit_assignment_path(assignment))
      expect(page).to have_css("p", text: "Volkswagen Golf (AAA123)")
      expect(page).to have_css("p", text: "Mary Jane")
    end
  end

  private

  def create_and_login_admin
    login_as(create(:admin), scope: :user)
  end
end
