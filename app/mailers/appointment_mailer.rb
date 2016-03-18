class AppointmentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.appointment_mailer.booked_appointment.subject
  #
  def booked_appointment(user)
    @user = user
    @appointment = user.customer.appointments.last

    mail to: user.email,
         subject: "Turno Solicitado"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.appointment_mailer.confirmed_appointment.subject
  #
  def confirmed_appointment
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.appointment_mailer.cancelled_appointment.subject
  #
  def cancelled_appointment
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.appointment_mailer.appointment_reminder.subject
  #
  def appointment_reminder
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
