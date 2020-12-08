class TrucksController < ApplicationController
  def index
    if request.post?
      @trucks = Truck.where("year >= ?", params[:orderbyyear])
    else
      @trucks = Truck.all
    end
  end

  def new
    @dealer = Dealer.find(params[:id])
  end

  def create
    truck = Truck.new(truck_params)

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
    truck.update!(truck_params)
    redirect_to "/trucks/#{truck.id}"
  end

  def destroy
    Truck.destroy(params[:id])
    redirect_to "/trucks"
  end

  private

  def truck_params
    params.permit(:year, :make, :model, :dealer_id)
  end
end
