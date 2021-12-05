class StoresController < ApplicationController

  def index
  end

  def new
    @store = Store.new
  end

  def create
    binding.pry
    @store = Store.new(store_params)
    if @store.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    store = Store.find(params[:id])
    store.destroy
    redirect_to root_path
  end

  private

  def store_params
    params.require(:store).permit(:store_name, user_ids: [])
  end
end
