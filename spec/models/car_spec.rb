require "rails_helper"

RSpec.describe Car, type: :model do
  it {is_expected.to belong_to(:user)}
  it {is_expected.to validate_presence_of(:brand)}
  it {is_expected.to validate_presence_of(:model)}

  it "provides a description" do
    car = create(:car,
                 brand: "fiat",
                 model: "spazio")

    expect(car.description).to eq("Fiat Spazio")
  end
end
