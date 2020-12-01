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
  end
end
