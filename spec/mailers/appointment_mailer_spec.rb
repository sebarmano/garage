require "rails_helper"

RSpec.describe AppointmentMailer, type: :mailer do
  describe "booked_appointment" do
    let(:mail) { AppointmentMailer.booked_appointment }
    let(:user) { create(:user) }

    it "renders the headers" do
      skip "learn how to test mailers"
      expect(mail.subject).to eq("Turno Solicitado")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["garage@gmail.com"])
    end

    it "renders the body" do
      skip "learn how to test mailers"
      expect(mail.body.encoded).to match("Turno Solicitado")
    end
  end

  describe "confirmed_appointment" do
    let(:mail) { AppointmentMailer.confirmed_appointment }

    it "renders the headers" do
      expect(mail.subject).to eq("Confirmed appointment")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["garage@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "cancelled_appointment" do
    let(:mail) { AppointmentMailer.cancelled_appointment }

    it "renders the headers" do
      expect(mail.subject).to eq("Cancelled appointment")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["garage@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "appointment_reminder" do
    let(:mail) { AppointmentMailer.appointment_reminder }

    it "renders the headers" do
      expect(mail.subject).to eq("Appointment reminder")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["garage@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end
end
