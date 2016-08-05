require "rails_helper"

feature "admin sees list of assignments" do
  scenario "in assignments page" do
    create_and_login_admin
    assignment = create(:assignment)

    visit assignments_path

    expect(page).to have_css("li.assignment", text: assignment.job)
  end

  private

  def create_and_login_admin
    login_as(create(:admin), scope: :user)
  end
end
