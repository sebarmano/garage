class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to dashboard_path, flash: {success: t("models.cars.creation")}
    end
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :license)
  end

end
