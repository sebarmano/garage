require "rails_helper"

RSpec.describe Appointment, type: :model do
  it { is_expected.to belong_to :car }
  it { is_expected.to belong_to :job }
  it { is_expected.to validate_presence_of :date_on }
  it { is_expected.to validate_presence_of :starts_at }
  it { is_expected.to validate_presence_of :duration }
  it { is_expected.to validate_presence_of :car }

  it "returns the list of appointments for a given date" do
    car = create(:car)
    appointment = create(:appointment, date_on: Date.tomorrow,
                                       car: car)
    create(:appointment, date_on: (Date.tomorrow + 1.day),
                                  car: car)

    expect(Appointment.list_for(Date.tomorrow)).to eq [appointment]
  end

  it "returns the start time and duration of appointments given a date" do
    appointment = create(:appointment)

    expect(Appointment.times_for(Date.tomorrow)).to eq [[appointment.starts_at,
                                                         appointment.duration]]
  end

  it "returns the already reserved hours on a date" do
    create(:appointment, date_on: Date.tomorrow,
                                       starts_at: "10:00 AM",
                                       duration: 2)

    expect(Appointment.reserved_hours_on(Date.tomorrow)).to eq [10, 11]
  end
end
