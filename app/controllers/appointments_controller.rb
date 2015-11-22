class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to dashboard_path, flash:
        {success: "El turno ha sido solicitado. Recibirá un correo electrónico cuando sea confirmado"}
    end
  end

  private
  def appointment_params
    params.require(:appointment).permit(:date_on, :starts_at, :car_id)
  end
end
