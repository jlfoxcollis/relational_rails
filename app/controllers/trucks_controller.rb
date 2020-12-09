class TrucksController < ApplicationController
  def index
    if params[:search] == ""
      redirect_to trucks_path
    elsif params["commit"] == "Sort"
      @trucks = Truck.sort_alphabetically
    elsif params["commit"] == "search"
      search(params)
    else
      @trucks = Truck.all
    end
  end

  def search(params)
    if params["radio"] == "orderbyyear"
      @trucks = Truck.search_year(search_params[:search])
    elsif params["radio"] == "Exact Match"
      @trucks = Truck.exact_search(search_params[:search])
    elsif params["radio"] == "Partial"
      @trucks = Truck.partial_search(search_params[:search])
    end
  end

  def new
  end

  def create
    if params[:make] == ""
      redirect_to new_truck_path(params[:dealer_id], :dealer_id => params[:dealer_id])
    else
      truck = Truck.new(truck_params)
      truck.save
      redirect_to trucks_dealer_path(truck.dealer_id)
    end
  end

  def show
    @truck = Truck.find(params[:id])
  end

  def edit
    @truck = Truck.find(params[:id])
  end

  def update
    if params[:make] == ""
      redirect_to edit_truck_path(params[:id])
    else
      truck = Truck.find(params[:id])
      truck.update!(truck_params)
      redirect_to show_truck_path(truck.id)
    end
  end

  def destroy
    truck = Truck.select(:dealer_id).find(params[:id])
    Truck.destroy(params[:id])
    redirect_to trucks_dealer_path(truck.dealer_id)
  end

  private

  def truck_params
    params.permit(:year, :make, :model, :dealer_id)
  end

  def search_params
    params.permit(:search)
  end
end
