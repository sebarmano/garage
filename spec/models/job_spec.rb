require "rails_helper"

RSpec.describe Job, type: :model do
  it { is_expected.to belong_to :job_type }
  it { is_expected.to belong_to :appointment }
end
