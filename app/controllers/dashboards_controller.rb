class DashboardsController < ApplicationController
  def show
    @appointments = Appointment.all
  end
end
