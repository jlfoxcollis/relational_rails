class DealersController < ApplicationController
  def index
    if params["commit"] == "Sort Dealers by Trucks count"
      @dealers = Dealer.sort_by_trucks_count
    else
      @dealers = Dealer.date_time_sort
    end
  end

  def show
    @dealer = Dealer.find(params[:id])
  end

  def new
  end

  def create
    if params[:name] == ""
      redirect_to "/dealers/new"
    else
      dealer = Dealer.new(dealer_params)
      dealer.save
      redirect_to '/dealers'
    end
  end


  def trucks
    @dealer = Dealer.find(params[:id])
    if request.post?
      @trucks = @dealer.sort_alphabetically
    else
      @trucks = @dealer.trucks
    end
  end

  def edit
    @dealer = Dealer.find(params[:id]).trucks
  end

  def update
    if params[:name] == ""
      redirect_to edit_dealer_path(params[:id])
    else
      dealer = Dealer.find(params[:id])
      dealer.update(dealer_params)
      redirect_to show_dealer_path(dealer.id)
    end
  end

  def destroy
    Dealer.destroy(params[:id])
    redirect_to dealers_path
  end
end

private

def dealer_params
  params.permit(:name, :city, :state, :open)
end
