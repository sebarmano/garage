class AppointmentAssignmentsController < ApplicationController
  def new
    @appointment = set_appointment
    @customer = Customer.new
    @customer.cars.build
  end

  def create
    appointment = set_appointment
    if appointment.uncompleted?
      appointment.car = set_car
      appointment.confirmed!
      redirect_to dashboard_path, flash: { success: "El turno ha sido asignado
                                           con éxito" }
    else
      redirect_to new_appointment_assignment_path, flash: { error: "Ha ocurrido
                                                            un error al intentar
                                                            asignar el turno" }
    end
  end

  private

  def set_appointment
    Appointment.find(params[:appointment_id])
  end

  def set_car
    Car.find(params[:car_id])
  end
end
