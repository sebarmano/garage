class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.admin?
      @appointments = Appointment.all
    else
      @appointments = current_customer.appointments
    end
  end

  def new
    if current_user.admin?
      @customer = params[:customer] if params[:customer]
    else
      @customer = current_customer
    end
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.duration = appointment_duration
    if current_user.admin? && @customer.nil?
      set_uncompleted_appointment
    end

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
                                        assignments_attributes:
                                          [:job_type_id, :_destroy])

  end

  def appointment_duration
    params[:appointment][:duration] || 2
  end

  def set_uncompleted_appointment
    @appointment.car = Car.where(brand: "default", license: "AAA000").first
    @appointment.status = "uncompleted"
  end
end
