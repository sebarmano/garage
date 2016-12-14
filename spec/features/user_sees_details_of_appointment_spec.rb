# frozen_string_literal: true
require "rails_helper"

feature "User sees details of an appointment" do
  context "as an admin" do
    scenario "from the appointments table" do
      create_and_login_admin
      job_type = create(:job_type, name: "Change tires")
      assignment = create(:assignment, job_type: job_type)
      appointment = create(:appointment,
                           assignments: [assignment],
                           date_on: Date.tomorrow)

      visit appointments_path
      click_on "Todos"
      first(:link, "Ver detalles").click

      expect(page).to have_current_path(appointment_path(appointment))
      expect(page).to have_css("div.appointment", text: Date.tomorrow)
      expect(page).to have_css("div.appointment",
                               text: appointment.customer_name)
      expect(page).to have_css("ul.assignments > li.assignment",
                               text: "Change tires")
    end
  end

  private

  def create_and_login_admin
    login_as(create(:admin), scope: :user)
  end
end
