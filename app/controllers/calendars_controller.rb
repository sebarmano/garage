class CalendarsController < ApplicationController
  def show
    @appointments = Appointment.active
  end
end
