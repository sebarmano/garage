require "rails_helper"

describe Assignment, type: :model do
  it { is_expected.to belong_to :job_type }
  it { is_expected.to belong_to :appointment }
  it { is_expected.to have_many :assignment_notes }
  it { is_expected.to define_enum_for(:status) }
  it { is_expected.to delegate_method(:car).to(:appointment) }
  it { is_expected.to delegate_method(:customer).to(:appointment) }

  describe "#job" do
    it "returns the name of the associated job" do
      job_type = build(:job_type, name: "Tire change")
      assignment = build_stubbed(:assignment, job_type: job_type)

      expect(assignment.job).to eq("Tire change")
    end
  end
end
