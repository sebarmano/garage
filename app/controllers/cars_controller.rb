class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if current_user.regular?
      @car.customer = current_customer
    end
    if @car.save
      redirect_to dashboard_path, flash: { success: t("models.cars.creation") }
    end
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :license, :customer_id)
  end
end
