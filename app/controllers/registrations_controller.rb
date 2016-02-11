class RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    set_minimum_password_length
    yield resource if block_given?
    resource.build_customer
    respond_with resource
  end

  protected

  def after_sign_up_path_for(*)
    new_car_path
  end

  private

  def sign_up_params
    params.require(resource_name).
           permit(:email,
                 :password,
                 :password_confirmation,
                 customer_attributes: [:fname, :lname, :phone,
                                       cars_attributes: [:brand,
                                                         :model,
                                                         :license]])
  end
end
