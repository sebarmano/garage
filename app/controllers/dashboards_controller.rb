class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def show
    if current_user.admin?
      admin_dashboard
    else
      user_dashboard
    end
  end

  private

  def admin_dashboard
    render "admin_show"
  end

  def user_dashboard
    @appointments = current_customer.appointments
    render "user_show"
  end
end
