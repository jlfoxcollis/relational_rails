class CarsController < ApplicationController
  def index
    @cars = Car.date_time_sort
  end

  def parent_index
    @cars = Car.where(road_id: params[:id]).date_time_sort
  end
  
  def show
    @car = Car.find(params[:id])
  end

  def new
  end

  def create
    if params[:name] == ""
      redirect_to "/roads/#{params[:road_id]}/cars/new"
    else
      Car.create({
        name: params[:name],
        parked?: params[:parked?],
        road_id: params[:road_id]
      })
      redirect_to "/roads/#{params[:road_id]}/cars"
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    car = Car.find(params[:id])
    if params[:name] == ""
      redirect_to "/cars/#{params[:id]}/edit"
    else
      car.update({
        name: params[:name],
        parked?: params[:parked?]
      })
      redirect_to "/cars/#{car.id}"
    end
  end

  def destroy
    Car.destroy(params[:id])
    redirect_to "/cars"
  end
end