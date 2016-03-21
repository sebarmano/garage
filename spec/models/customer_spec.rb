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

  describe "#search" do
    before (:each) do
      @first = create(:customer, fname: "John", lname: "Smith")
      @second = create(:customer, fname: "Jane", lname: "Doe")
      @third = create(:customer, fname: "Robert", lname: "Robertson")
    end

    it "returns ordered list of customers without any search string" do
      search = ""

      expect(Customer.search(search).pluck(:lname)).to eq %w(Doe Robertson
                                                            Smith)
    end

    it "returns ordered case insensitive list of first name matches with search
   string" do
      search = "j"
      expect(Customer.search(search).pluck(:lname)).to eq %w(Doe Smith)
    end

    it "returns ordered case insensitive list of last name matches with search
   string" do
      search = "s"
      expect(Customer.search(search).pluck(:lname)).to eq %w(Robertson Smith)
    end

    it "returns empty list of customers without matches in first / last name" do
      search = "z"
      expect(Customer.search(search)).to eq []
    end
  end
end
