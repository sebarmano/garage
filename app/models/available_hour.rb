class AvailableHour
  OPEN_HOUR = 8
  CLOSE_HOUR = 20
  LUNCH_BREAK_START = 12
  LUNCH_BREAK_END = 16
  CLOSED_HOURS = Array(0...OPEN_HOUR) +
                 Array(LUNCH_BREAK_START...LUNCH_BREAK_END) +
                 Array(CLOSE_HOUR...24)

  def initialize(date)
    @date = date
  end

  def reserved_hours
    busy_hours = []
    appointment_times_for(@date).each do |app|
      start_hour = app[0].hour
      end_hour = start_hour + app[1]
      busy_hours << Array(start_hour...end_hour)
    end
    busy_hours.flatten
  end

  def get_unavailable_hours
    CLOSED_HOURS + reserved_hours
  end

  private

  def appointment_times_for(date)
    Appointment.where(date_on: @date).pluck(:starts_at, :duration)
  end



end
