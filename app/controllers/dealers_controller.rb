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
      state: params[:dealer][:state]
    })

    dealer.save

    redirect_to '/dealers'
  end
end
