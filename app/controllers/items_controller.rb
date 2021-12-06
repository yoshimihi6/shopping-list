class ItemsController < ApplicationController
  def index
    @item = Item.new
    @store = Store.find(params[:store_id])
    @items = @store.items.includes(:user)
  end

  def new
    @item = Item.new
    @store = Store.find(params[:store_id])
    @items = @store.items.includes(:user)
  end

  def create
    @store = Store.find(params[:store_id])
    @item = @store.items.new(item_params)
    if @item.save
      redirect_to store_items_path(@store)
    else
      @items = @store.items.includes(:user)
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :content, :image).merge(user_id: current_user.id)
  end
end
