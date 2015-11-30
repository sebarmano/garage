require "rails_helper"

RSpec.describe Appointment, type: :model do
  it { is_expected.to belong_to :car }
  it { is_expected.to belong_to :job }
  it { is_expected.to validate_presence_of :date_on }
  it { is_expected.to validate_presence_of :starts_at }
  it { is_expected.to validate_presence_of :duration }
  it { is_expected.to validate_presence_of :car }
end
