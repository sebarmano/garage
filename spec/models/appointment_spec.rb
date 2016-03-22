require "rails_helper"

RSpec.describe Appointment, type: :model do
  it { is_expected.to belong_to :car }
  it { is_expected.to have_one :customer }
  it { is_expected.to validate_presence_of :date_on }
  it { is_expected.to validate_presence_of :starts_at }
  it { is_expected.to validate_presence_of :duration }
  it { is_expected.to define_enum_for(:status) }

  context "with no car" do
    context "with regular context" do
      it "is expected to be invalid" do
        appointment = build(:appointment, car: nil)
        expect(appointment.valid?(:regular)).not_to eq true
      end
    end

    context "with other context" do
      it "is expected to be valid" do
        appointment = build(:appointment, car: nil)
        expect(appointment.valid?).to eq true
      end
    end
  end

  it "has status of 'booked' when is created" do
    appointment = create(:appointment)

    expect(appointment.booked?).to be true
  end

  it "returns the list of appointments for a given date" do
    car = create(:car)
    appointment = create(:appointment, date_on: Date.tomorrow,
                                       car: car)
    create(:appointment, date_on: (Date.tomorrow + 1.day),
                                  car: car)

    expect(Appointment.list_for(Date.tomorrow)).to eq [appointment]
  end

  it "returns the start time and duration of appointments given a date" do
    appointment = create(:appointment, date_on: Date.tomorrow)

    expect(Appointment.times_for(Date.tomorrow)).to eq [[appointment.starts_at,
                                                         appointment.duration]]
  end

  it "returns the already reserved hours on a date" do
    create(:appointment, date_on: Date.tomorrow,
                         starts_at: "10:00 AM",
                         duration: 2)

    expect(Appointment.reserved_hours_on(Date.tomorrow)).to eq [10, 11]
  end

  it "returns its customer name" do
    customer = create(:customer, fname: "John", lname: "Smith")
    car = create(:car, customer: customer)
    appointment = create(:appointment, car: car)

    expect(appointment.customer_name).to eq("John Smith")
  end

  it "returns its time" do
    appointment = create(:appointment, starts_at: "10:00 AM")

    expect(appointment.time).to eq("10:00")
  end

  it "returns its date and time" do
    appointment = create(:appointment, date_on: Date.tomorrow,
                                       starts_at: "10:00 AM")
    expect(appointment.date_and_time).to eq("#{Date.tomorrow} - 10:00")
  end
end
