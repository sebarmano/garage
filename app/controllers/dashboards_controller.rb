class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def show
    @appointments = Appointment.all
  end
end
