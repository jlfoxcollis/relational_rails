class TrucksDealerController < ApplicationController
  def index
    @dealer = Dealer.find(params[:id])
    if params["commit"] == "filter"
      @trucks = @dealer.sort_alphabetically
    else
      @trucks = @dealer.trucks
    end
  end
end
