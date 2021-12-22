class BuysController < ApplicationController
  before_action :authenticate_user!

  def index
    @buy_shipping = BuyShipping.new
    @item=Item.find(params[:item_id])
    redirect_to root_path if @item.user_id == current_user.id || @item.buy.present?
  end
  
  def new
    @buy_shipping = BuyShipping.new
  end
  
  def create
    @buy_shipping = BuyShipping.new(buy_params)
    @item=Item.find(params[:item_id])
    if @buy_shipping.valid?
      @buy_shipping.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def buy_params
    params.require(:buy_shipping).permit(:postal_code, :prefecture_id, :city, :house_num, :building, :tel_num).merge(item_id: params[:item_id], user_id: current_user.id)
  end
  
end
