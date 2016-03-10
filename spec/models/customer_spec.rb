require "rails_helper"

RSpec.describe Customer, type: :model do
  it { is_expected.to have_one :user }
  it { is_expected.to have_many :cars }
  it { is_expected.to have_many :appointments }
  it { is_expected.to validate_presence_of :fname }
  it { is_expected.to validate_presence_of :lname }

  it "returns full name" do
    customer = create(:customer, fname: "John", lname: "Smith")

    expect(customer.name).to eq("John Smith")
  end
end
