require "rails_helper"

RSpec.describe Car, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:brand) }
  it { is_expected.to validate_presence_of(:model) }
  it { is_expected.to validate_presence_of(:license) }


  it "provides a description" do
    car = create(:car,
                 brand: "fiat",
                 model: "spazio",
                 license: "AAA111" )

    expect(car.description).to eq("Fiat Spazio (AAA111)")
  end
end
