require "rails_helper"

feature "admin sees list of customers" do
  before do
    create(:customer, fname: "John", lname: "Smith")
    create(:customer, fname: "Jane", lname: "Doe")
    admin = create(:user, :admin)
    login_as(admin, scope: :user)
  end

  scenario "from dashboard search" do
    visit dashboard_path
    expect_to_see_customer_search_form

    fill_in_customer_search_form
    click_on "Buscar"

    expect(current_path).to eq(customers_path)
    expect(page).to have_content("John Smith")
    expect(page).not_to have_content("Jane Doe")
  end

  scenario "from customer index page search" do
    visit customers_path
    expect_to_see_customer_search_form

    fill_in_customer_search_form
    click_on "Buscar"

    expect(current_path).to eq(customers_path)
    expect(page).to have_content("John Smith")
    expect(page).not_to have_content("Jane Doe")
  end

  private

  def expect_to_see_customer_search_form
    expect(page).to have_css("div form.search-customer")
  end

  def fill_in_customer_search_form
    fill_in :search, with: "John"
  end
end
