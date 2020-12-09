class CarsRoadController < ApplicationController
  def index
    if params["commit"] == "alphabetize"
      @cars = Road.find(params[:id]).alphabetical
    else
      @cars = Car.where(road_id: params[:id]).date_time_sort
    end
  end
end