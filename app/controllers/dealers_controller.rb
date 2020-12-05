class DealersController < ApplicationController
  def index
    @dealers = Dealer.all
  end

  def new
  end

  def create
    dealer = Dealer.new({
      name: params[:name],
      city: params[:city],
      state: params[:state],
      open: params[:open]
    })

    dealer.save

    redirect_to '/dealers'
  end

  def show
    @dealer = Dealer.find(params[:id])
  end

  def trucks
    @dealer = Dealer.find(params[:id])
    @trucks = @dealer.trucks
  end

  def edit
    @dealer = Dealer.find(params[:id]).trucks
  end

  def update
    dealer = Dealer.find(params[:id])
    dealer.update({
      name: params[:name],
      city: params[:city],
      state: params[:state],
      open: params[:open]
    })
    redirect_to "/dealers/#{dealer.id}"
  end

  def destroy
    Dealer.destroy(params[:id])
    redirect_to '/dealers'
  end
end
