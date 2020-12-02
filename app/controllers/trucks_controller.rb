class TrucksController < ApplicationController
  def index
    @trucks = Truck.all
  end

  def new
  end

  def create
    truck = Truck.new({
      year: params[:truck][:year],
      make: params[:truck][:make],
      model: params[:truck][:model],
      dealer_id: params[:truck][:dealer_id]
    })

    truck.save

    redirect_to '/trucks'
  end

  def show
    @truck = Truck.find(params[:id])
  end

end
