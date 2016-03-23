require "rails_helper"

RSpec.describe NullAppointment, type: :model do
  before :each do
    @null_appointment = NullAppointment.new
  end
  it "returns no time" do
    expect(@null_appointment.time).to eq("Ninguno")
  end
  it "returns no time" do
    expect(@null_appointment.date_and_time).to eq("Ninguno")
  end
end
