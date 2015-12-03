class AvailableHoursController < ApplicationController
  def index
    unavailable_hours = AvailableHour.new(params[:date]).
                         get_unavailable_hours
    render json: unavailable_hours
  end
end
