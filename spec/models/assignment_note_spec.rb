require "rails_helper"

describe AssignmentNote, type: :model do
  it { is_expected.to belong_to :assignment }
  it { is_expected.to validate_presence_of :content }
end
