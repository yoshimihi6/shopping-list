class ItemsController < ApplicationController
  def index
    @item = Item.new
    @store = Store.find(params[:store_id])
  end

  def create
    @store = Store.find(params[:store_id])
    @item = @store.items.new(item_params)
    if @item.save
      redirect_to store_items_path(@store)
    else
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :content).merge(user_id: current_user.id)
  end
end
