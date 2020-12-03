class TrucksController < ApplicationController
  def index
    @trucks = Truck.all
  end

  def new
    @dealer = Dealer.find(params[:id])
  end

  def create
    truck = Truck.new({
      year: params[:year],
      make: params[:make],
      model: params[:model],
      dealer_id: params[:dealer_id]
    })

    truck.save

    redirect_to "/dealers/#{truck.dealer_id}/trucks"
  end

  def show
    @truck = Truck.find(params[:id])
  end

  def edit
    @truck = Truck.find(params[:id])
  end

  def update
    truck = Truck.find(params[:id])
    truck.update({
      year: params[:year],
      make: params[:make],
      model: params[:model],
      dealer_id: params[:dealer_id]
    })
    redirect_to "/dealers/#{truck.dealer_id}/trucks/#{truck.id}"
  end

  def destroy
    Truck.destroy(params[:id])
    redirect_to "/trucks"
  end
end
