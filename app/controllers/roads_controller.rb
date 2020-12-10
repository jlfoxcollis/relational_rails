class RoadsController < ApplicationController
  def index
    @num_cars = false
    if params["commit"] == "sort"
      @roads = Road.by_cars
      @num_cars = true
    elsif params["commit"] == "filter"
      @roads = Road.more_lanes_than(params["lane filter"])
    else
      @roads = Road.all
    end
  end


  def show
    @road = Road.find(params[:id])
  end

  def new
  end

  def create
    Road.create({
      name: params[:name],
      open?: params[:open?],
      lanes: params[:lanes],
      date_created: params[:datetime]
      })
    redirect_to '/roads'
  end

  def edit
    @road = Road.find(params[:id])
  end

  def update
    road = Road.find(params[:id])
    road.update({
      name: params[:name],
      open?: params[:open?],
      lanes: params[:lanes],
    })
    redirect_to "/roads/#{road.id}"
  end

  def destroy
    Road.destroy(params[:id])
    redirect_to '/roads'
  end
end
