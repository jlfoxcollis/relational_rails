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
end