# Preview all emails at http://localhost:3000/rails/mailers/appointment_mailer
class AppointmentMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/appointment_mailer/booked_appointment
  def booked_appointment
    user = User.first
    AppointmentMailer.booked_appointment(user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/appointment_mailer/confirmed_appointment
  def confirmed_appointment
    AppointmentMailer.confirmed_appointment
  end

  # Preview this email at http://localhost:3000/rails/mailers/appointment_mailer/cancelled_appointment
  def cancelled_appointment
    AppointmentMailer.cancelled_appointment
  end

  # Preview this email at http://localhost:3000/rails/mailers/appointment_mailer/appointment_reminder
  def appointment_reminder
    AppointmentMailer.appointment_reminder
  end
end
