class RoadsController < ApplicationController
  def index
    @roads = Road.all
  end

  def show
    @road = Road.find(params[:id])
  end

  def new
  end

  def create
    Road.create({
      name: params[:road][:name],
      parking?: params[:road][:parking?],
      open?: params[:road][:open?],
      lanes: params[:road][:lanes],
      date_created: params[:road][:datetime]
    })
    redirect_to '/roads'
  end

  def edit
    @road = Road.find(params[:id])
  end

  def update
    road = Road.find(params[:id])
    road.update({
      name: params[:road][:name],
      parking?: params[:road][:parking?],
      open?: params[:road][:open?],
      lanes: params[:road][:lanes],
    })
    redirect_to "/roads/#{road.id}"
  end

  def destroy
    Road.destroy(params[:id])
    # someday this will work:  Cars.delete_all(params[:id])
    redirect_to '/roads'
  end
end