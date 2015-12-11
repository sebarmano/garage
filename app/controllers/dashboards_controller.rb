class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def show
    @appointments = current_user.appointments
  end
end
