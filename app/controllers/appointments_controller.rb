class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.car = appointment_car
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

  end

  private

  def appointment_params
    params.require(:appointment).permit(:date_on, :starts_at, :car)
  end

  def appointment_car
    params[:appointment][:car] || current_user.cars.first
  end

  def appointment_duration
    params[:appointment][:duration] || 2
  end
end
