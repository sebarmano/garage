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

  def get_unavailable_hours
    CLOSED_HOURS + Appointment.reserved_hours_on(@date)
  end
end
