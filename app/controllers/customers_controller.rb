class CustomersController < ApplicationController
  def new
    @customer = Customer.new
    @customer.cars.build
    if current_user.admin?
      @appointment = set_appointment
      render "new_admin_customer"
    end
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      add_car_to_appointment(@customer.cars.last)
      redirect_to dashboard_path, flash: { success: "El nuevo cliente ha sido
      registrado con éxito" }
    else
      render "new_customer_path"
    end
  end

  private

  def customer_params
    params.required(:customer).permit(:fname, :lname, :phone, :appointment_id,
                                      cars_attributes: [:brand, :model,
                                                        :license])
  end

  def set_appointment
    Appointment.find(params[:appointment_id]) if params[:appointment_id]
  end

  def add_car_to_appointment(car)
    appointment = set_appointment
    if appointment && appointment.uncompleted?
      appointment.car = car
      appointment.confirmed!
    end
  end
end
