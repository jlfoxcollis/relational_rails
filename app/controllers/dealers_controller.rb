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
    dealer = Dealer.new({
      name: params[:name],
      city: params[:city],
      state: params[:state],
      open: params[:open]
    })

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
    dealer.update_column(:updated_at, Time.now)
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
