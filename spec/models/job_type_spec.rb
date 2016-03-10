require "rails_helper"

RSpec.describe JobType, type: :model do
  it { is_expected.to have_many :assignments }
  it { is_expected.to have_many :appointments }
end
