class CalendarsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only

  def show
    @appointments = Appointment.active
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to dashboard_path, alert: "Access denied"
    end
  end
end
