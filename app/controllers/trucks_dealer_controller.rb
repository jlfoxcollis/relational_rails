class TrucksDealerController < ApplicationController
  def index
    if params[:search] == ""
      redirect_to trucks_dealer_path(params[:id])
    end
    @dealer = Dealer.find(params[:id])
    if params["commit"] == "Sort"
      @trucks = @dealer.sort_alphabetically
    elsif params["commit"] == "search"
      search(params)
    else
      @trucks = @dealer.trucks
    end
  end

  def search(params)
    @dealer = Dealer.find(params[:id])
    if params["radio"] == "orderbyyear"
      @trucks = @dealer.search_year(search_params[:search])
    elsif params["radio"] == "Exact Match"
      @trucks = @dealer.exact_search(search_params[:search])
    elsif params["radio"] == "Partial"
      @trucks = @dealer.partial_search(search_params[:search])
    end
  end

  private

  def search_params
    params.permit(:search)
  end
end
