class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(*)
    new_car_path
  end
end
