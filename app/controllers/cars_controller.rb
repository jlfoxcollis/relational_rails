class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def parent_index
    @cars = Car.all
    @cars = @cars.select do |car|
      car.road.id.to_s == params[:id]
    end
  end
  
  def show
    @car = Car.find(params[:id])
  end

  def new
  end

  def create
    Car.create({
      name: params[:name],
      driving?: params[:driving?],
      parked?: params[:parked?],
      road_id: params[:road_id]
    })
    redirect_to "/roads/#{params[:road_id]}/cars"
  end
end