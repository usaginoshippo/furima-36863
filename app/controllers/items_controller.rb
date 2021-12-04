class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @items = Item.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def show
  #   @item = Item.find(params[:id])
  # end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_explanation, :category_id,
                                 :product_condition_id, :ship_cost_id, :prefecture_id, :ship_day_id,
                                 :price).merge(user_id: current_user.id)
  end
end
