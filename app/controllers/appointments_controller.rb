class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      @appointments = Appointment.all
    else
      @appointments = current_user.appointments
    end
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.duration = appointment_duration

    if @appointment.save
      AppointmentMailer.booked_appointment(current_user).deliver_later
      redirect_to dashboard_path, flash:
        { success: "El turno ha sido solicitado.
          Recibirá un correo electrónico cuando sea confirmado." }
    else
      render :new
    end
  end

  def confirm
    get_appointments.map(&:confirmed!)
    redirect_to appointments_path, flash: { success: "#{get_appointments.count}
                                            turnos fueron confirmados" }
  end

  private

  def get_appointments
    Appointment.find(params[:appointment_ids])
  end

  def appointment_params
    params.require(:appointment).permit(:date_on,
                                        :starts_at,
                                        :car_id,
                                        :note,
                                        :job_type_ids => [])

  end

  def appointment_duration
    params[:appointment][:duration] || 2
  end
end
