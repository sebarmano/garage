require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many :cars }
  it { is_expected.to have_many :appointments }
  it { is_expected.to define_enum_for :role }

  it "has role of customer by default when created" do
    user = create(:user)

    expect(user.regular?).to eq true
  end
end
