require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to belong_to :customer }
  it { is_expected.to define_enum_for :role }
  it { is_expected.to delegate_method(:fname).to(:customer) }
  it { is_expected.to delegate_method(:appointments).to(:customer) }

  it "has role of customer by default when created" do
    user = create(:user)

    expect(user.regular?).to eq true
  end
end
