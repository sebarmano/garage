require "rails_helper"

feature "admin sees list of assignments" do
  scenario "in assignments page" do
    create_and_login_admin
    job = create(:job_type, name: "Change tires")
    create(:assignment, job_type: job)

    visit assignments_path

    expect(page).to have_css("li.assignment", text: "Change tires")
  end

  private

  def create_and_login_admin
    login_as(create(:admin), scope: :user)
  end
end
