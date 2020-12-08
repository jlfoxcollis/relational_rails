class CarsRoadController < ApplicationController
  def index
    @cars = Car.where(road_id: params[:id]).date_time_sort
  end
end