class DealersController < ApplicationController
  def index
    if request.post?
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
    dealer = Dealer.new(dealer_params)
    dealer.save
    redirect_to '/dealers'
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
    dealer = Dealer.find(params[:id])
    dealer.update(dealer_params)
    redirect_to "/dealers/#{dealer.id}"
  end

  def destroy
    Dealer.destroy(params[:id])
    redirect_to '/dealers'
  end
end

private

def dealer_params
  params.permit(:name, :city, :state, :open)
end
