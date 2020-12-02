class DealersController < ApplicationController
  def index
    @dealers = Dealer.all
  end

  def new
  end

  def create
    dealer = Dealer.new({
      name: params[:dealer][:name],
      city: params[:dealer][:city],
      state: params[:dealer][:state],
      open: params[:dealer][:open]
    })

    dealer.save

    redirect_to '/dealers'
  end

  def show
    @dealer = Dealer.find(params[:id])
    @trucks = Truck.all
  end

  def trucks
    @dealer = Dealer.find(params[:id])
    @trucks = Truck.all
  end

  def edit
    @dealer = Dealer.find(params[:id])
  end

  def update
    dealer = Dealer.find(params[:id])
    dealer.update({
      name: params[:dealer][:name],
      city: params[:dealer][:city],
      state: params[:dealer][:state],
      open: params[:dealer][:open]
    })
    redirect_to "/dealers/#{dealer.id}"
  end

  def destroy
    Dealer.destroy(params[:id])
    redirect_to '/dealers'
  end
end
