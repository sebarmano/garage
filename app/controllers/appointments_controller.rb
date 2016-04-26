class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      @appointments = Appointment.includes(:customer)
    else
      @appointments = current_customer.appointments
    end
  end

  def new
    if current_user.admin?
      @customer = set_customer if params[:customer]
    else
      @customer = current_customer
    end
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save(context: current_user.role)
      if @appointment.user
        AppointmentMailer.booked_appointment(@appointment.user).
          deliver_later
      end
      redirect_to dashboard_path, flash:
        { success: "El turno ha sido solicitado.
          Recibirá un correo electrónico cuando sea confirmado." }
    else
      render :new
    end
  end

  def confirm
    get_appointments.confirmed!
    redirect_to appointments_path, flash: { success:
                                            "El turno fue confirmado" }
  end

  def cancel
    get_appointments.cancelled!
    redirect_to appointments_path, flash: { success:
                                            "El turno fue cancelado" }
  end

  private

  def get_appointments
    Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date_on,
                                        :starts_at,
                                        :car_id,
                                        :note,
                                        assignments_attributes:
                                          [:job_type_id, :_destroy])

  end

  def set_customer
    Customer.find(params[:customer])
  end
end
